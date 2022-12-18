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

    settings.Add("split_levels", true, "Splits Coming Out Of Levels");
    settings.CurrentDefaultParent = "split_levels";

    settings.Add("split_botanisk_have", true, "Split after Botanisk Have.");
    settings.SetToolTip("split_botanisk_have", "Splits once the hub loads after the level is completed.");

    settings.Add("split_kastellet", true, "Split after Kastellet.");
    settings.SetToolTip("split_kastellet", "Splits once the hub loads after the level is completed.");

    settings.Add("split_valby", true, "Split after Valby.");
    settings.SetToolTip("split_valby", "Splits once the hub loads after the level is completed.");

    settings.Add("split_assistens_kirkegard", true, "Split after Assistens Kirkegård.");
    settings.SetToolTip("split_assistens_kirkegard", "Splits once the hub loads after the level is completed.");

    settings.Add("split_christiania", true, "Split after Christiania.");
    settings.SetToolTip("split_christiania", "Splits once the hub loads after the level is completed.");

    settings.Add("split_orstedsparken", true, "Split after Ørstedsparken.");
    settings.SetToolTip("split_orstedsparken", "Splits once the hub loads after the level is completed.");

    settings.Add("split_sydhavnen", true, "Split after Sydhavnen.");
    settings.SetToolTip("split_sydhavnen", "Splits once the hub loads after the level is completed.");

    settings.Add("split_bella_center", true, "Split after Bella Center.");
    settings.SetToolTip("split_bella_center", "Splits once the hub loads after the level is completed.");

    settings.Add("split_vesterbro", true, "Split after Vesterbro.");
    settings.SetToolTip("split_vesterbro", "Splits once the hub loads after the level is completed.");

    settings.Add("split_klovermarken", true, "Split after Kløvermarken.");
    settings.SetToolTip("split_klovermarken", "Splits once the hub loads after the level is completed.");

    settings.Add("split_kastrup", true, "Split after Kastrup.");
    settings.SetToolTip("split_kastrup", "Splits once the hub loads after the level is completed.");

    settings.Add("split_planetarium", true, "Split after Planetarium.");
    settings.SetToolTip("split_planetarium", "Splits once the hub loads after the level is completed.");

    settings.Add("split_tarnby", true, "Split after Tårnby.");
    settings.SetToolTip("split_tarnby", "Splits once the hub loads after the level is completed.");

    settings.Add("split_reffen", true, "Split after Reffen.");
    settings.SetToolTip("split_reffen", "Splits once the hub loads after the level is completed.");

    settings.Add("split_norrebroparken", true, "Split after Nørrebroparken.");
    settings.SetToolTip("split_norrebroparken", "Splits once the hub loads after the level is completed.");

    settings.Add("split_amalienborg", false, "Split after Amalienborg.");
    settings.SetToolTip("split_amalienborg", "Splits once the main menu loads after the cutscene is played.");

    settings.Add("split_struts", true, "Split after Struts.");
    settings.SetToolTip("split_struts", "Splits once the main menu loads after the level is completed.");

    settings.Add("split_snabel_a", true, "Split after Snabel-A.");
    settings.SetToolTip("split_snabel_a", "Splits once the main menu loads after the level is completed.");

    settings.Add("split_fika", true, "Split after Fika.");
    settings.SetToolTip("split_fika", "Splits once the main menu loads after the level is completed.");

    settings.Add("split_sar_skrivning", true, "Split after Sär Skrivning.");
    settings.SetToolTip("split_sar_skrivning", "Splits once the main menu loads after the level is completed.");

    settings.CurrentDefaultParent = "splits";
    settings.Add("split_hub", true, "Splits Going Into Levels");
    settings.CurrentDefaultParent = "split_hub";

    settings.Add("split_hub_botanisk_have", false, "Split going into Botanisk Have.");
    settings.SetToolTip("split_hub_botanisk_have", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_kastellet", false, "Split going into Kastellet.");
    settings.SetToolTip("split_hub_kastellet", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_valby", false, "Split going into Valby.");
    settings.SetToolTip("split_hub_valby", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_assistens_kirkegard", false, "Split going into Assistens Kirkegård.");
    settings.SetToolTip("split_hub_assistens_kirkegard", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_christiania", false, "Split going into Christiania.");
    settings.SetToolTip("split_hub_christiania", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_orstedsparken", false, "Split going into Ørstedsparken.");
    settings.SetToolTip("split_hub_orstedsparken", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_sydhavnen", false, "Split going into Sydhavnen.");
    settings.SetToolTip("split_hub_sydhavnen", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_bella_center", false, "Split going into Bella Center.");
    settings.SetToolTip("split_hub_bella_center", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_vesterbro", false, "Split going into Vesterbro.");
    settings.SetToolTip("split_hub_vesterbro", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_klovermarken", false, "Split going into Kløvermarken.");
    settings.SetToolTip("split_hub_klovermarken", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_kastrup", false, "Split going into Kastrup.");
    settings.SetToolTip("split_hub_kastrup", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_planetarium", false, "Split going into Planetarium.");
    settings.SetToolTip("split_hub_planetarium", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_tarnby", false, "Split going into Tårnby.");
    settings.SetToolTip("split_hub_tarnby", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_reffen", false, "Split going into Reffen.");
    settings.SetToolTip("split_hub_reffen", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_norrebroparken", false, "Split going into Nørrebroparken.");
    settings.SetToolTip("split_hub_norrebroparken", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_amalienborg", true, "Split going into Amalienborg.");
    settings.SetToolTip("split_hub_amalienborg", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_struts", false, "Split going into Struts.");
    settings.SetToolTip("split_hub_struts", "Splits as soon as the level is loaded. Can be used to time main menu menuing separately");

    settings.Add("split_hub_snabel_a", false, "Split going into Snabel-A.");
    settings.SetToolTip("split_hub_snabel_a", "Splits as soon as the level is loaded. Can be used to time main menu menuing separately");

    settings.Add("split_hub_fika", false, "Split going into Fika.");
    settings.SetToolTip("split_hub_fika", "Splits as soon as the level is loaded. Can be used to time main menu menuing separately");

    settings.Add("split_hub_sar_skrivning", false, "Split going into Sär Skrivning.");
    settings.SetToolTip("split_hub_sar_skrivning", "Splits as soon as the level is loaded. Can be used to time main menu menuing separately");


    settings.CurrentDefaultParent = "splits";

    settings.Add("start_il", false, "Start Timer on Level Start");
    settings.SetToolTip("start_il", "Starts the timer whenever you start a level, not just from the main menu. Good for individual level runs.");

    settings.Add("split_triangles", false, "Only Split With All Triangles Collected");
    settings.SetToolTip("split_triangles", "Doesn't split if you've missed a Triangle in a level. This does support going back to get it, the splitter will split when you return to world map.");

    settings.CurrentDefaultParent = null;
    settings.Add("misc", true, "Miscellaneous Features");
    settings.CurrentDefaultParent = "misc";

    settings.Add("triangles_tracking", false, "Track Collected Triangles");
    settings.SetToolTip("triangles_tracking", "Adds a text component that tracks how many triangles you have collected out of the total amount in the current level.");

    settings.Add("gameTimeReminder", true, "Game Time Reminder");
    settings.SetToolTip("gameTimeReminder", "Reminds you to enable comparing to game time if you're not.");

    // Adding a 0 at the start to display that scenes outside of levels have no triangles.
    // Adding a 0 at the end to display that scenes in the Bonus World have no triangles.
    vars.trianglesPerScene = new int[] {0, 3, 0, 3, 0, 5, 0, 4, 0, 3, 0, 5, 0, 5, 0, 5, 0, 0};
    vars.collectedTrianglesPerScene = new int[] {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

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
        vars.collectedTrianglesPerScene = new int[] {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    });
    timer.OnStart += vars.ResetVars;

    vars.CheckTriangles = (Func<bool, bool, bool>)((shouldSplit, setting_enabled) => {
        if(setting_enabled) {
            if(vars.collectedTrianglesPerScene[vars.lastLevel] == vars.trianglesPerScene[vars.lastLevel]) {
                return shouldSplit;
            }
            else {
                return false;
            }
        }
        else {
            return shouldSplit;
        }
    });
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

        if(settings["triangles_tracking"]) {
            vars.UpdateTrianglesTracker(0);
        }

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
        print(vars.currentScene.Current.ToString());

        vars.lastLevel = vars.currentLevel;
        // Scenes outside of levels
        if(vars.currentScene.Current <= 6) {
            vars.currentLevel = 0;
        }
        // Scenes in the bonus world
        else if(vars.currentScene.Current >= 24){
            vars.currentLevel = 17;
        }
        // Levels from the Story World
        else {
            vars.currentLevel = vars.currentScene.Current - 6; 
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
    if(vars.currentScene.Old == 5 && vars.currentScene.Current == 4) {
        return vars.CheckTriangles(settings["split_botanisk_have"], settings["split_triangles"]);
    }
    
    if(vars.currentScene.Old == 6 && vars.currentScene.Current == 4) {
        return vars.CheckTriangles(settings["split_kastellet"], settings["split_triangles"]);
    }
    
    if(vars.currentScene.Old == 7 && vars.currentScene.Current == 4) {
        return vars.CheckTriangles(settings["split_valby"], settings["split_triangles"]);
    }
    
    if(vars.currentScene.Old == 8 && vars.currentScene.Current == 4) {
        return vars.CheckTriangles(settings["split_assistens_kirkegard"], settings["split_triangles"]);
    }
    
    if(vars.currentScene.Old == 9 && vars.currentScene.Current == 4) {
        return vars.CheckTriangles(settings["split_christiania"], settings["split_triangles"]);
    }
    
    if(vars.currentScene.Old == 10 && vars.currentScene.Current == 4) {
        return vars.CheckTriangles(settings["split_orstedsparken"], settings["split_triangles"]);
    }
    
    if(vars.currentScene.Old == 11 && vars.currentScene.Current == 4) {
        return vars.CheckTriangles(settings["split_sydhavnen"], settings["split_triangles"]);
    }
    
    if(vars.currentScene.Old == 12 && vars.currentScene.Current == 4) {
        return vars.CheckTriangles(settings["split_bella_center"], settings["split_triangles"]);
    }
    
    if(vars.currentScene.Old == 13 && vars.currentScene.Current == 4) {
        return vars.CheckTriangles(settings["split_vesterbro"], settings["split_triangles"]);
    }
    
    if(vars.currentScene.Old == 14 && vars.currentScene.Current == 4) {
        return vars.CheckTriangles(settings["split_klovermarken"], settings["split_triangles"]);
    }
    
    if(vars.currentScene.Old == 15 && vars.currentScene.Current == 4) {
        return vars.CheckTriangles(settings["split_kastrup"], settings["split_triangles"]);
    }
    
    if(vars.currentScene.Old == 16 && vars.currentScene.Current == 4) {
        return vars.CheckTriangles(settings["split_planetarium"], settings["split_triangles"]);
    }
    
    if(vars.currentScene.Old == 17 && vars.currentScene.Current == 4) {
        return vars.CheckTriangles(settings["split_tarnby"], settings["split_triangles"]);
    }
    
    if(vars.currentScene.Old == 18 && vars.currentScene.Current == 4) {
        return vars.CheckTriangles(settings["split_reffen"], settings["split_triangles"]);
    }
    
    if(vars.currentScene.Old == 19 && vars.currentScene.Current == 4) {
        return vars.CheckTriangles(settings["split_norrebroparken"], settings["split_triangles"]);
    }
    
    if(vars.currentScene.Old == 21 && vars.currentScene.Current == 2) {
        return vars.CheckTriangles(settings["split_amalienborg"], settings["split_triangles"]);
    }
    
    if(vars.currentScene.Old == 22 && vars.currentScene.Current == 2) {
        return vars.CheckTriangles(settings["split_struts"], settings["split_triangles"]);
    }
    
    if(vars.currentScene.Old == 23 && vars.currentScene.Current == 2) {
        return vars.CheckTriangles(settings["split_snabel_a"], settings["split_triangles"]);
    }
    
    if(vars.currentScene.Old == 24 && vars.currentScene.Current == 2) {
        return vars.CheckTriangles(settings["split_fika"], settings["split_triangles"]);
    }
    
    if(vars.currentScene.Old == 25 && vars.currentScene.Current == 2) {
        return vars.CheckTriangles(settings["split_sar_skrivning"], settings["split_triangles"]);
    }


    if(vars.currentScene.Old == 4 && vars.currentScene.Current == 5) {
        return settings["split_hub_botanisk_have"];
    }

    if(vars.currentScene.Old == 4 && vars.currentScene.Current == 6) {        
        return settings["split_hub_kastellet"];
    }

    if(vars.currentScene.Old == 4 && vars.currentScene.Current == 7) {        
        return settings["split_hub_valby"];
    }

    if(vars.currentScene.Old == 4 && vars.currentScene.Current == 8) {        
        return settings["split_hub_assistens_kirkegard"];
    }

    if(vars.currentScene.Old == 4 && vars.currentScene.Current == 9) {        
        return settings["split_hub_christiania"];
    }

    if(vars.currentScene.Old == 4 && vars.currentScene.Current == 10) {        
        return settings["split_hub_orstedsparken"];
    }

    if(vars.currentScene.Old == 4 && vars.currentScene.Current == 11) {        
        return settings["split_hub_sydhavnen"];
    }

    if(vars.currentScene.Old == 4 && vars.currentScene.Current == 12) {        
        return settings["split_hub_bella_center"];
    }

    if(vars.currentScene.Old == 4 && vars.currentScene.Current == 13) {        
        return settings["split_hub_vesterbro"];
    }

    if(vars.currentScene.Old == 4 && vars.currentScene.Current == 14) {        
        return settings["split_hub_klovermarken"];
    }

    if(vars.currentScene.Old == 4 && vars.currentScene.Current == 15) {        
        return settings["split_hub_kastrup"];
    }

    if(vars.currentScene.Old == 4 && vars.currentScene.Current == 16) {        
        return settings["split_hub_planetarium"];
    }

    if(vars.currentScene.Old == 4 && vars.currentScene.Current == 17) {        
        return settings["split_hub_tarnby"];
    }

    if(vars.currentScene.Old == 4 && vars.currentScene.Current == 18) {        
        return settings["split_hub_reffen"];
    }

    if(vars.currentScene.Old == 4 && vars.currentScene.Current == 19) {        
        return settings["split_hub_norrebroparken"];
    }

    if(vars.currentScene.Old == 4 && vars.currentScene.Current == 20) {        
        return settings["split_hub_amalienborg"];
    }

    if(vars.currentScene.Old == 4 && vars.currentScene.Current == 22) {        
        return settings["split_hub_struts"];
    }

    if(vars.currentScene.Old == 4 && vars.currentScene.Current == 23) {        
        return settings["split_hub_snabel_a"];
    }

    if(vars.currentScene.Old == 4 && vars.currentScene.Current == 24) {        
        return settings["split_hub_fika"];
    }

    if(vars.currentScene.Old == 4 && vars.currentScene.Current == 25) {        
        return settings["split_hub_sar_skrivning"];
    }

    return false;
}

isLoading {
    if(settings["load_removal"]) {
        return vars.loadState.Current;
    }
}

start {
    if((vars.currentScene.Old == 2 && vars.currentScene.Current == 6) || (vars.currentScene.Old == 2 && vars.currentScene.Current == 24)) {
        return true;
    }

    if(settings["start_il"]) {
        if((vars.currentScene.Old == 6 && vars.currentScene.Current > 6) || (vars.currentScene.Old == 24 && vars.currentScene.Current >= 24)) {
            return true;
        }
    }

    return false;
}
