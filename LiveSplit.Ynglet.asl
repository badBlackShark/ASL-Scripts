state("Ynglet") {
}

startup {
    vars.scanTarget = new SigScanTarget(0, 
        "22 B5 30 8A EF A0 BA 49", // Magic Long
        "?? 00 00 00 00 00 00 00", // loadState
        "00 ?? ?? ?? ?? ?? ?? ??", // trueGameTime
        "?? 00 00 00", // currentScene
        "?? 00 00 00", // sessionTriangles
        "?? 00 00 00", // levelTriangles
        "?? 00 00 00" // sessionAttempts
    );

    settings.Add("load_removal", true, "Load Removal");
    settings.SetToolTip("load_removal", "Load Removal pauses the timer during loading zones.");

    settings.Add("splits", true, "Splits");
    settings.CurrentDefaultParent = "splits";

    settings.Add("split_levels", true, "Split After Levels");
    settings.SetToolTip("split_levels", "Splits once the hub loads in after levels / the main menu loads after bonus levels. Can be used for all categories.");

    settings.Add("split_hub", false, "Split Hub Separately");
    settings.SetToolTip("split_hub", "Splits whenever a level is entered from the hub, so overworld movement can be split separately.");

    settings.Add("start_il", false, "Start Timer on Level Start");
    settings.SetToolTip("start_il", "Starts the timer whenever you start a level, not just from the main menu. Good for individual level runs.");

    settings.Add("split_triangles", false, "Only Split With All Triangles Collected");
    settings.SetToolTip("split_triangles", "Doesn't split if you've missed a Triangle in a level. This does support going back to get it, the splitter will split when you return to world map.");

    settings.CurrentDefaultParent = null;
    settings.Add("misc", true, "Miscellaneous Features");
    settings.CurrentDefaultParent = "misc";

    settings.Add("triangles_tracking", false, "Track Collected Triangles");
    settings.SetToolTip("triangles_tracking", "Adds a text component that tracks how many triangles you have collected out of the total amount in the current level. This only works if you don't quit the level.");

    settings.Add("gameTimeReminder", true, "Game Time Reminder");
    settings.SetToolTip("gameTimeReminder", "Reminds you to enable comparing to game time if you're not.");

    // Adding a 0 at the start to display that scenes outside of levels have no triangles.
    vars.trianglesPerScene = new int[] {0, 3, 0, 3, 0, 5, 0, 4, 0, 3, 0, 5, 0, 5, 0, 5, 0, 0, 0, 0, 0, 0};
    vars.collectedTrianglesPerScene = new int[] {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

    vars.textSettingTriangles = null;
    vars.lastLevel = 0;
    vars.currentLevel = 0;

    // Text components adapted from https://github.com/Voxelse/ASLScripts/blob/master/Livesplit.ActionHenk/Livesplit.ActionHenk.asl

    // Update function of the triangles tracker
    vars.UpdateTrianglesTracker = (Action<int>)((id) => {
        if(vars.textSettingTriangles == null)
            vars.textSettingTriangles = vars.SearchOrCreateComponent("Triangles Collected: ");

        vars.textSettingTriangles.Text2 = vars.collectedTrianglesPerScene[id].ToString() + " / " + vars.trianglesPerScene[id];
    });

    // Search a text component with a specified name. Create it if not found.
    vars.SearchOrCreateComponent = (Func<string, dynamic>)((name) => {
        dynamic textSetting = null;
        foreach (dynamic component in timer.Layout.Components) {
            if (component.GetType().Name == "TextComponent" && component.Settings.Text1 == name) {
                textSetting = component.Settings;
                break;
            }
        }

        if(textSetting == null)
            textSetting = vars.CreateTextComponent(name);

        return textSetting;
    });

    // Component creation function
    vars.CreateTextComponent = (Func<string, dynamic>)((name) => {
        var textComponentAssembly = Assembly.LoadFrom("Components\\LiveSplit.Text.dll");
        dynamic textComponent = Activator.CreateInstance(textComponentAssembly.GetType("LiveSplit.UI.Components.TextComponent"), timer);
        timer.Layout.LayoutComponents.Add(new LiveSplit.UI.Components.LayoutComponent("LiveSplit.Text.dll", textComponent as LiveSplit.UI.Components.IComponent));
        textComponent.Settings.Text1 = name;
        return textComponent.Settings;
    });

    vars.ResetVars = (EventHandler)((s, e) => {
        vars.collectedTrianglesPerScene = new int[] {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
        vars.UpdateTrianglesTracker(0);
    });
    timer.OnStart += vars.ResetVars;
}

// Adapted from https://github.com/CryZe/AHatInTimeAutoSplitter/blob/master/AHatInTime.asl
init {
    vars.threadScan = new Thread(() => {
        var ptr = IntPtr.Zero;

        print("[Ynglet Autosplitter] Scanning memory");
        foreach (var page in game.MemoryPages(true)) {
            var scanner = new SignatureScanner(game, page.BaseAddress, (int)page.RegionSize);

            if (ptr == IntPtr.Zero) {
                ptr = scanner.Scan(vars.scanTarget);
            } else { 
                break;
            }
        }

        if (ptr == IntPtr.Zero) {
            // Waiting for the game to have booted up. This is a pretty ugly work
            // around, but we don't really know when the game is booted or where the
            // struct will be, so to reduce the amount of searching we are doing, we
            // sleep a bit between every attempt.
            Thread.Sleep(1000);
            throw new Exception();
        }

        vars.loadState = new MemoryWatcher<bool>(ptr + 0x08);
        vars.trueGameTime = new MemoryWatcher<double>(ptr + 0x10);
        vars.currentScene = new MemoryWatcher<int>(ptr + 0x18);
        vars.sessionTriangles = new MemoryWatcher<int>(ptr + 0x1C);
        vars.levelTriangles = new MemoryWatcher<int>(ptr + 0x20);
        vars.sessionAttempts = new MemoryWatcher<int>(ptr + 0x24); // Not currently used, but maybe somewhen

        vars.watchers = new MemoryWatcherList() {
            vars.loadState,
            vars.trueGameTime,
            vars.currentScene,
            vars.sessionTriangles,
            vars.levelTriangles,
            vars.sessionAttempts
        };

        if(settings["triangles_tracking"]) vars.UpdateTrianglesTracker(0);

        vars.watchers.UpdateAll(game);
        print("[Ynglet Autosplitter] Done scanning");
        print(vars.loadState.Current.ToString());
        print(vars.trueGameTime.Current.ToString());
        print(vars.currentScene.Current.ToString());
        print(vars.sessionTriangles.Current.ToString());
        print(vars.levelTriangles.Current.ToString());
        print(vars.sessionAttempts.Current.ToString());
    });
    vars.threadScan.Start();

    if (timer.CurrentTimingMethod == TimingMethod.RealTime && settings["gameTimeReminder"]){
        var message = MessageBox.Show(
            "Would you like to change the current timing method to\nGame Time instead of Real Time?", 
            "LiveSplit | Ynglet Auto Splitter", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

        if (message == DialogResult.Yes){
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }
}

update {
    if(vars.threadScan.IsAlive) {
        return false;
    }

    vars.watchers.UpdateAll(game);

    if(vars.currentScene.Old != vars.currentScene.Current) {
        vars.lastLevel = vars.currentLevel;
        if(vars.currentScene.Current <= 4) {
            vars.currentLevel = 0;
        }
        else {
            vars.currentLevel = vars.currentScene.Current - 4; 
        }
    }

    if(vars.levelTriangles.Old < vars.levelTriangles.Current) {
        vars.collectedTrianglesPerScene[vars.currentLevel]++;
    }

    if(settings["triangles_tracking"]) {
        vars.UpdateTrianglesTracker(vars.currentLevel);
    }
}

split {
    if(settings["split_levels"]) {
        if(vars.currentScene.Old > 4 && vars.currentScene.Current == 4 ||
           vars.currentScene.Old == 4 && vars.currentScene.Current == 20 ||
           vars.currentScene.Old >= 22 && vars.currentScene.Current == 2) {
            if(settings["split_triangles"]) {
                if(vars.collectedTrianglesPerScene[vars.lastLevel] == vars.trianglesPerScene[vars.lastLevel]) {
                    return true;
                }
            }
            else {
                return true;                
            }
        }
    }

    if(settings["split_hub"]) {
        if(vars.currentScene.Old == 4 && vars.currentScene.Current > 4) {
            return true;
        }
    }

    return false;
}

isLoading {
    if(settings["load_removal"]) {
        return vars.loadState.Current;
    }
}

start {
    if(settings["start_il"]) {
        if(vars.currentScene.Old == 4 && vars.currentScene.Current > 4 || vars.currentScene.Old == 2 && vars.currentScene.Current >= 22) {
            return true;
        }
    }

    if(vars.currentScene.Old == 2 && vars.currentScene.Current == 4) {
        return true;
    }

    return false;
}
