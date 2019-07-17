state("GodsTrigger") {
    // Values found by badBlackShark
    int LevelState       : "UnityPlayer.dll", 0x0144BD08, 0xB8,  0x100, 0x8,  0x20, 0x98;
    int LoadState        : "mono.dll"       , 0x002675E0, 0xA0,  0x780, 0x0,  0xA0, 0x2B8;
    int EnemiesRemaining : "UnityPlayer.dll", 0x01483840, 0x130, 0x3D0, 0x10, 0x0,  0x5B0;
    int DeathsPerLevel   : "UnityPlayer.dll", 0x0147DEC0, 0x8,   0x18,  0x80, 0x28, 0x3A4;
}

startup {
    settings.Add("load_removal", true, "Load Removal");
    settings.SetToolTip("load_removal", "Load Removal pauses the timer during loading zones.");
    settings.Add("enemy_counter", false, "Remaining Enemies Counter");
    settings.SetToolTip("enemy_counter", "Shows you how many enemies are remaining on the current stage.");
    settings.Add("all_kills_split", false, "All Kills Splitting");
    settings.SetToolTip("all_kills_split", "Checks if you killed every enemy when splitting.");
    settings.Add("death_counter", false, "Death Counter");
    settings.SetToolTip("death_counter", "Shows you how often you died during your run.");

    vars.LevelOffset = new int[28]{
        0, // 0-0
        1, // 0-1
        0, // 1-1
        0, // 1-2
        0, // 1-3
        0, // 1-4
        0, // 1-5
        0, // 2-1
        0, // 2-2 The prisoners count, so you *might* end this with 4 enemies left.
        0, // 2-3
        0, // 2-4
        0, // 2-5
        0, // 3-1
        0, // 3-2
        0, // 3-3
        0, // 3-4
        0, // 3-5
        0, // 3-6
        0, // 4-1
        0, // 4-2
        0, // 4-3
        0, // 4-4
        0, // 4-5
        0, // 5-1
        0, // 5-2
        1, // 5-3
        0, // 5-4
        0  // 5-5
    };

    vars.TextEnemiesRemaining = null;
    vars.TextDeathCounter     = null;
    vars.EnemiesRemaining     = 0;
    vars.DeathCounter         = 0;

    vars.UpdateEnemiesRemaining = (Action)(() => {
        if(vars.TextEnemiesRemaining == null) {
            foreach (dynamic component in timer.Layout.Components) {
                if (component.GetType().Name != "TextComponent") continue;

                if (component.Settings.Text1 == "Enemies Remaining:"){
                    vars.TextEnemiesRemaining = component.Settings;
                    break;
                }
            }

            if(vars.TextEnemiesRemaining == null) {
                vars.TextEnemiesRemaining = vars.CreateTextComponent("Enemies Remaining:");
            }
        }

        vars.TextEnemiesRemaining.Text2 = vars.EnemiesRemaining.ToString();
    });

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
        vars.CurrentLevel = 0;
        vars.DeathCounter = 0;
        vars.UpdateDeathCounter();
    });
    timer.OnStart += vars.ResetVars;
}

init {
    // We need this because those actions don't have old and current states.
    vars.NeedSplit    = false;
    vars.Starting     = false;
    vars.CurrentLevel = 0;
    
}

update {
    vars.EnemiesRemaining = current.EnemiesRemaining - vars.LevelOffset[vars.CurrentLevel];

    if(old.LevelState == 1 && current.LevelState == 2 && current.LoadState == 1) {
        if(settings["all_kills_split"]) {
            if(vars.CurrentLevel == 8) {
                // This is because the prisoners count as enemies in this, and if you play even remotely close to
                // perfectly, there will still be 4 prisoners on the map when you complete the level.
                vars.NeedSplit = vars.EnemiesRemaining < 5;
            }
            else {
                vars.NeedSplit = vars.EnemiesRemaining < 1;
            }
        }
        else {
            vars.NeedSplit = true;
        }
    }
    if(old.LevelState == 2 && current.LevelState == 1) {
        vars.Starting = true;
    }

    if(settings["enemy_counter"] && old.EnemiesRemaining != current.EnemiesRemaining){
        vars.UpdateEnemiesRemaining();
    }

    if(settings["death_counter"] && old.DeathsPerLevel < current.DeathsPerLevel) {
        vars.DeathCounter += 1;
        vars.UpdateDeathCounter();
    }

    return true;
}

split {
    if(vars.NeedSplit == true) {
        vars.NeedSplit = false;
        vars.CurrentLevel += 1;
        return true;
    }
    return false;
}

start {
    if(vars.Starting == true) {
        vars.Starting = false;
        return true;
    }
}

isLoading {
    if(settings["load_removal"]) {
        return current.LoadState == 256;
    }
}
