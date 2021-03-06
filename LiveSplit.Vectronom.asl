state("Vectronom") {
    // Values found by badBlackShark and -7

    int completed_levels : "UnityPlayer.dll", 0x0179B168, 0x208, 0xA8,  0x50, 0x188, 0x120;
    int game_state       : "UnityPlayer.dll", 0x0179B168, 0x208, 0xA8,  0x68, 0x188, 0x128;
    int DeathsPerLevel   : "UnityPlayer.dll", 0x0179B168, 0x4D8, 0x100, 0x18, 0x60,  0x138;
}

startup {
    settings.Add("category_any", true, "Any% Splitting");
    settings.SetToolTip("category_any", "Auto-splitting for Any% runs.");

    settings.Add("load_removal", true, "Load Removal");
    settings.SetToolTip("load_removal", "Load Removal pauses the timer during loading zones.");

    settings.Add("death_counter", false, "Death Counter");
    settings.SetToolTip("death_counter", "Shows you how often you died during your run.");

    vars.TextDeathCounter = null;
    vars.DeathCounter     = 0;

    // TODO: Make it so the "Deaths This Run:" field is deleted when the setting is turned off
    vars.UpdateDeathCounter = (Action)(() => {
        bool found = false;

        foreach (dynamic component in timer.Layout.Components) {
            if (component.GetType().Name != "TextComponent") continue;

            if (component.Settings.Text1 == "Deaths This Run:"){
                found = true;
                vars.TextDeathCounter = component.Settings;
                break;
            }
        }

        if(!found) {
            vars.TextDeathCounter = vars.CreateTextComponent("Deaths This Run:");
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
    });
    timer.OnStart += vars.ResetVars;
}

update {
    if(settings["death_counter"]) {
        if(old.DeathsPerLevel < current.DeathsPerLevel) {
            vars.DeathCounter += 1;
        }
        vars.UpdateDeathCounter();
    }

    return true;
}

split {
    if(settings["category_any"]) {
        if(old.completed_levels < current.completed_levels) {
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

start {
    return old.game_state == 2 && current.game_state == 1 || old.game_state == 2 && current.game_state == 3;
}
