state("Vectronom") {
	// Values found by badBlackShark

	int completed_levels : "UnityPlayer.dll", 0x01546C30, 0x128, 0x8,  0x38, 0x60, 0x100;
	int game_state       : "UnityPlayer.dll", 0x01546C30, 0x120, 0x0,  0x38, 0x60, 0x108;
	int DeathsPerLevel   : "UnityPlayer.dll", 0x01501B80, 0x608, 0x30, 0xA8, 0x28, 0xAC;
}

startup {
	settings.Add("category_any", true, "Any% Splitting");
	settings.SetToolTip("category_any", "Auto-splitting for Any% runs.");

	settings.Add("load_removal", true, "Load Removal");
	settings.SetToolTip("load_removal", "Load Removal pauses the timer during loading zones.");

	settings.Add("death_counter", false, "Death Counter");
    settings.SetToolTip("death_counter", "Shows you how often you died during your run.");

    vars.TextDeathCounter     = null;
	vars.DeathCounter         = 0;

	vars.UpdateDeathCounter = (Action)(() => {
        if(vars.TextDeathCounter == null) {
            foreach (dynamic component in timer.Layout.Components) {
                if (component.GetType().Name != "TextComponent") continue;

                if (component.Settings.Text1 == "Deaths This Run:"){
                    vars.TextDeathCounter = component.Settings;
                    break;
                }
            }

            if(vars.TextDeathCounter == null) {
                vars.TextDeathCounter = vars.CreateTextComponent("Deaths This Run:");
            }
        }

        vars.TextDeathCounter.Text2 = vars.DeathCounter.ToString();
    });

    vars.CreateTextComponent = (Func<string, dynamic>)((name) => {
        var textComponentAssembly = Assembly.LoadFrom("Components\\LiveSplit.Text.dll");
        dynamic textComponent = Activator.CreateInstance(textComponentAssembly.GetType("LiveSplit.UI.Components.TextComponent"), timer);
        timer.Layout.LayoutComponents.Add(new LiveSplit.UI.Components.LayoutComponent("LiveSplit.Text.dll", textComponent as LiveSplit.UI.Components.IComponent));
        textComponent.Settings.Text1 = name;
        return textComponent.Settings;
    });

    vars.ResetVars = (EventHandler)((s, e) => {
        vars.DeathCounter = 0;
        vars.UpdateDeathCounter();
    });
    timer.OnStart += vars.ResetVars;
}

init {
	// We need this because the split action doesn't have old and current states.
	vars.need_split = false;
}

update {
	if(old.completed_levels < current.completed_levels) {
		vars.need_split = true;
	}

	if(settings["death_counter"] && old.DeathsPerLevel < current.DeathsPerLevel) {
        vars.DeathCounter += 1;
        vars.UpdateDeathCounter();
    }

	return true;
}

split {
	if(settings["category_any"]) {
		if(vars.need_split == true) {
			vars.need_split = false;
			return true;
		}
	}

	return false;
}

isLoading {
	if(settings["load_removal"]) {
		return current.game_state == 1;
	}
}
