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

    settings.Add("split_story_levels", true, "Splits Coming Out Of Story Levels");
    settings.CurrentDefaultParent = "split_story_levels";

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

    settings.CurrentDefaultParent = "splits";
    settings.Add("split_bonus_levels", true, "Splits Coming Out Of Bonus Levels");
    settings.CurrentDefaultParent = "split_bonus_levels";

    settings.Add("split_struts", true, "Split after Struts.");
    settings.SetToolTip("split_struts", "Splits once the hub loads after the level is completed.");

    settings.Add("split_ekorre", true, "Split after Ekorre.");
    settings.SetToolTip("split_ekorre", "Splits once the hub loads after the level is completed.");

    settings.Add("split_snabel_a", true, "Split after Snabel-A.");
    settings.SetToolTip("split_snabel_a", "Splits once the hub loads after the level is completed.");

    settings.Add("split_fyrkant", true, "Split after Fyrkant.");
    settings.SetToolTip("split_fyrkant", "Splits once the hub loads after the level is completed.");

    settings.Add("split_fika", true, "Split after Fika.");
    settings.SetToolTip("split_fika", "Splits once the hub loads after the level is completed.");

    settings.Add("split_braket", true, "Split after Bråket.");
    settings.SetToolTip("split_braket", "Splits once the hub loads after the level is completed.");

    settings.Add("split_sar_skrivning", true, "Split after Sär Skrivning.");
    settings.SetToolTip("split_sar_skrivning", "Splits once the hub loads after the level is completed.");

    settings.Add("split_katten", true, "Split after Katten.");
    settings.SetToolTip("split_katten", "Splits once the hub loads after the level is completed.");

    settings.Add("split_fuffens", true, "Split after Fuffens.");
    settings.SetToolTip("split_fuffens", "Splits once the hub loads after the level is completed.");

    settings.Add("split_vovven", true, "Split after Vovven.");
    settings.SetToolTip("split_vovven", "Splits once the hub loads after the level is completed.");

    settings.Add("split_oatit", true, "Split after Oätit.");
    settings.SetToolTip("split_oatit", "Splits once the hub loads after the level is completed.");

    settings.Add("split_namnlos", true, "Split after Namnlös.");
    settings.SetToolTip("split_namnlos", "Splits once the hub loads after the level is completed.");

    settings.Add("split_krokodil", true, "Split after Krokodil.");
    settings.SetToolTip("split_krokodil", "Splits once the hub loads after the level is completed.");

    settings.Add("split_grotslev", true, "Split after Grötslev.");
    settings.SetToolTip("split_grotslev", "Splits once the hub loads after the level is completed.");

    settings.Add("split_sill", true, "Split after Sill.");
    settings.SetToolTip("split_sill", "Splits once the hub loads after the level is completed.");

    settings.Add("split_triangel", true, "Split after Triangel.");
    settings.SetToolTip("split_triangel", "Splits once the hub loads after the level is completed.");

    settings.Add("split_stolen", true, "Split after Stolen.");
    settings.SetToolTip("split_stolen", "Splits once the hub loads after the level is completed.");

    settings.Add("split_pannkakan", true, "Split after Pannkakan.");
    settings.SetToolTip("split_pannkakan", "Splits once the hub loads after the level is completed.");

    settings.Add("split_koppen", true, "Split after Koppen.");
    settings.SetToolTip("split_koppen", "Splits once the hub loads after the level is completed.");

    settings.Add("split_bullen", true, "Split after Bullen.");
    settings.SetToolTip("split_bullen", "Splits once the hub loads after the level is completed.");

    settings.Add("split_ostroken", true, "Split after Ostroken.");
    settings.SetToolTip("split_ostroken", "Splits once the hub loads after the level is completed.");

    settings.Add("split_kotten", true, "Split after Kotten.");
    settings.SetToolTip("split_kotten", "Splits once the hub loads after the level is completed.");

    settings.Add("split_tack", true, "Split after Tack.");
    settings.SetToolTip("split_tack", "Splits once the hub loads after the level is completed.");

    settings.Add("split_slutet", false, "Split after Slutet.");
    settings.SetToolTip("split_slutet", "Splits once the main menu loads after the cutscene is played.");

    settings.CurrentDefaultParent = "splits";
    settings.Add("split_special_levels", true, "Splits Coming Out Of Special Levels");
    settings.CurrentDefaultParent = "split_special_levels";

    settings.Add("split_kamelasa", false, "Split after Kamelåså.");
    settings.SetToolTip("split_kamelasa", "Splits once the main menu loads after the cutscene is played.");

    settings.Add("split_dimoplacy", false, "Split after Dimoplacy.");
    settings.SetToolTip("split_dimoplacy", "Splits once the main menu loads after the cutscene is played.");

    settings.Add("split_milagro", false, "Split after Milagro.");
    settings.SetToolTip("split_milagro", "Splits once the main menu loads after the cutscene is played.");

    settings.Add("split_minne", false, "Split after Minne.");
    settings.SetToolTip("split_minne", "Splits once the main menu loads after the cutscene is played.");

    settings.Add("split_bluegie_nights", false, "Split after Bluegie Nights.");
    settings.SetToolTip("split_bluegie_nights", "Splits once the main menu loads after the cutscene is played.");

    settings.Add("split_nayas_lair", false, "Split after Naya's Lair.");
    settings.SetToolTip("split_nayas_lair", "Splits once the main menu loads after the cutscene is played.");

    settings.Add("split_hel_verdoemenis", false, "Split after Hel & Verdoemenis.");
    settings.SetToolTip("split_hel_verdoemenis", "Splits once the main menu loads after the cutscene is played.");

    settings.Add("split_syggelekokle", false, "Split after Syggelekokle.");
    settings.SetToolTip("split_syggelekokle", "Splits once the main menu loads after the cutscene is played.");

    settings.Add("split_stikling", false, "Split after Stikling.");
    settings.SetToolTip("split_stikling", "Splits once the main menu loads after the cutscene is played.");

    settings.Add("split_franz_jager", false, "Split after Franz Jäger.");
    settings.SetToolTip("split_franz_jager", "Splits once the main menu loads after the cutscene is played.");

    settings.Add("split_erjingtino", false, "Split after Erjingtino.");
    settings.SetToolTip("split_erjingtino", "Splits once the main menu loads after the cutscene is played.");

    settings.Add("split_sally", false, "Split after Sally.");
    settings.SetToolTip("split_sally", "Splits once the main menu loads after the cutscene is played.");

    settings.Add("split_fin", false, "Split after Fin.");
    settings.SetToolTip("split_fin", "Splits once the main menu loads after the cutscene is played.");

    settings.CurrentDefaultParent = "splits";
    settings.Add("split_story_hub", true, "Splits Going Into Story Levels");
    settings.CurrentDefaultParent = "split_story_hub";

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

    settings.CurrentDefaultParent = "splits";
    settings.Add("split_bonus_hub", true, "Splits Going Into Bonus Levels");
    settings.CurrentDefaultParent = "split_bonus_hub";

    settings.Add("split_hub_struts", false, "Split going into Struts.");
    settings.SetToolTip("split_hub_struts", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_ekorre", false, "Split going into Ekkore.");
    settings.SetToolTip("split_hub_ekorre", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_snabel_a", false, "Split going into Snabel-A.");
    settings.SetToolTip("split_hub_snabel_a", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_fyrkant", false, "Split going into Fyrkant.");
    settings.SetToolTip("split_hub_fyrkant", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_fika", false, "Split going into Fika.");
    settings.SetToolTip("split_hub_fika", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_braket", false, "Split going into Bråket.");
    settings.SetToolTip("split_hub_braket", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_sar_skrivning", false, "Split going into Sär Skrivning.");
    settings.SetToolTip("split_hub_sar_skrivning", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_katten", false, "Split going into Katten.");
    settings.SetToolTip("split_hub_katten", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_fuffens", false, "Split going into Fuffens.");
    settings.SetToolTip("split_hub_fuffens", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_vovven", false, "Split going into Vovven.");
    settings.SetToolTip("split_hub_vovven", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_oatit", false, "Split going into Oätit.");
    settings.SetToolTip("split_hub_oatit", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_namnlos", false, "Split going into Namnlös.");
    settings.SetToolTip("split_hub_namnlos", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_krokodil", false, "Split going into Krokodil.");
    settings.SetToolTip("split_hub_krokodil", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_grotslev", false, "Split going into Grötslev.");
    settings.SetToolTip("split_hub_grotslev", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_sill", false, "Split going into Sill.");
    settings.SetToolTip("split_hub_sill", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_triangel", false, "Split going into Triangel.");
    settings.SetToolTip("split_hub_triangel", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_stolen", false, "Split going into Stolen.");
    settings.SetToolTip("split_hub_stolen", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_pannkakan", false, "Split going into Pannkakan.");
    settings.SetToolTip("split_hub_pannkakan", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_koppen", false, "Split going into Koppen.");
    settings.SetToolTip("split_hub_koppen", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_bullen", false, "Split going into Bullen.");
    settings.SetToolTip("split_hub_bullen", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_ostroken", false, "Split going into Ostroken.");
    settings.SetToolTip("split_hub_ostroken", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_kotten", false, "Split going into Kotten.");
    settings.SetToolTip("split_hub_kotten", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_tack", false, "Split going into Tack.");
    settings.SetToolTip("split_hub_tack", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_slutet", true, "Split going into Slutet.");
    settings.SetToolTip("split_hub_slutet", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.CurrentDefaultParent = "splits";
    settings.Add("split_special_hub", true, "Splits Going Into Special Levels");
    settings.CurrentDefaultParent = "split_special_hub";

    settings.Add("split_hub_kamelasa", false, "Split going into Kamelåså.");
    settings.SetToolTip("split_hub_kamelasa", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_dimoplacy", false, "Split going into Dimoplacy.");
    settings.SetToolTip("split_hub_dimoplacy", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_milagro", false, "Split going into Milagro.");
    settings.SetToolTip("split_hub_milagro", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_minne", false, "Split going into Minne.");
    settings.SetToolTip("split_hub_minne", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_bluegie_nights", false, "Split going into Bluegie Nights.");
    settings.SetToolTip("split_hub_bluegie_nights", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_nayas_lair", false, "Split going into Naya's Lair.");
    settings.SetToolTip("split_hub_nayas_lair", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_hel_verdoemenis", false, "Split going into Hel & Verdoemenis.");
    settings.SetToolTip("split_hub_hel_verdoemenis", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_syggelekokle", false, "Split going into Syggelekokle.");
    settings.SetToolTip("split_hub_syggelekokle", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_stikling", false, "Split going into Stikling.");
    settings.SetToolTip("split_hub_stikling", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_franz_jager", false, "Split going into Franz Jäger.");
    settings.SetToolTip("split_hub_franz_jager", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_erjingtino", false, "Split going into Erjingtino.");
    settings.SetToolTip("split_hub_erjingtino", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_sally", false, "Split going into Sally.");
    settings.SetToolTip("split_hub_sally", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");

    settings.Add("split_hub_fin", false, "Split going into Fin.");
    settings.SetToolTip("split_hub_fin", "Splits as soon as the level is loaded. Can be used to time overworld movement separately");


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
        vars.lastLevel = vars.currentLevel;
        // Scenes outside of Story Worlds levels
        if(vars.currentScene.Current <= 6) {
            vars.currentLevel = 0;
        }
        // Scenes in the Bonus and Special World
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
    // Splits if exiting a level and loading the Story World map
    if(vars.currentScene.Current == 6){
        switch((int) vars.currentScene.Old){
            case 7: return vars.CheckTriangles(settings["split_botanisk_have"], settings["split_triangles"]);
            case 8: return vars.CheckTriangles(settings["split_kastellet"], settings["split_triangles"]);
            case 9: return vars.CheckTriangles(settings["split_valby"], settings["split_triangles"]);
            case 10: return vars.CheckTriangles(settings["split_assistens_kirkegard"], settings["split_triangles"]);
            case 11: return vars.CheckTriangles(settings["split_christiania"], settings["split_triangles"]);
            case 12: return vars.CheckTriangles(settings["split_orstedsparken"], settings["split_triangles"]);
            case 13: return vars.CheckTriangles(settings["split_sydhavnen"], settings["split_triangles"]);
            case 14: return vars.CheckTriangles(settings["split_bella_center"], settings["split_triangles"]);
            case 15: return vars.CheckTriangles(settings["split_vesterbro"], settings["split_triangles"]);
            case 16: return vars.CheckTriangles(settings["split_klovermarken"], settings["split_triangles"]);
            case 17: return vars.CheckTriangles(settings["split_kastrup"], settings["split_triangles"]);
            case 18: return vars.CheckTriangles(settings["split_planetarium"], settings["split_triangles"]);
            case 19: return vars.CheckTriangles(settings["split_tarnby"], settings["split_triangles"]);
            case 20: return vars.CheckTriangles(settings["split_reffen"], settings["split_triangles"]);
            case 21: return vars.CheckTriangles(settings["split_norrebroparken"], settings["split_triangles"]);
        }
    }
    // Splits if exiting a level and loading the Bonus World map
    if(vars.currentScene.Current == 24){
        switch((int) vars.currentScene.Old){
            case 25: return vars.CheckTriangles(settings["split_struts"], settings["split_triangles"]);
            case 26: return vars.CheckTriangles(settings["split_ekorre"], settings["split_triangles"]);
            case 27: return vars.CheckTriangles(settings["split_snabel_a"], settings["split_triangles"]);
            case 28: return vars.CheckTriangles(settings["split_fyrkant"], settings["split_triangles"]);
            case 29: return vars.CheckTriangles(settings["split_fika"], settings["split_triangles"]);
            case 30: return vars.CheckTriangles(settings["split_braket"], settings["split_triangles"]);
            case 31: return vars.CheckTriangles(settings["split_sar_skrivning"], settings["split_triangles"]);
            case 32: return vars.CheckTriangles(settings["split_katten"], settings["split_triangles"]);
            case 33: return vars.CheckTriangles(settings["split_fuffens"], settings["split_triangles"]);
            case 34: return vars.CheckTriangles(settings["split_vovven"], settings["split_triangles"]);
            case 35: return vars.CheckTriangles(settings["split_oatit"], settings["split_triangles"]);
            case 36: return vars.CheckTriangles(settings["split_namnlos"], settings["split_triangles"]);
            case 37: return vars.CheckTriangles(settings["split_krokodil"], settings["split_triangles"]);
            case 38: return vars.CheckTriangles(settings["split_grotslev"], settings["split_triangles"]);
            case 39: return vars.CheckTriangles(settings["split_sill"], settings["split_triangles"]);
            case 40: return vars.CheckTriangles(settings["split_triangel"], settings["split_triangles"]);
            case 41: return vars.CheckTriangles(settings["split_stolen"], settings["split_triangles"]);
            case 42: return vars.CheckTriangles(settings["split_pannkakan"], settings["split_triangles"]);
            case 43: return vars.CheckTriangles(settings["split_koppen"], settings["split_triangles"]);
            case 44: return vars.CheckTriangles(settings["split_bullen"], settings["split_triangles"]);
            case 45: return vars.CheckTriangles(settings["split_ostroken"], settings["split_triangles"]);
            case 46: return vars.CheckTriangles(settings["split_kotten"], settings["split_triangles"]);
            case 47: return vars.CheckTriangles(settings["split_tack"], settings["split_triangles"]);
        }
    }
    // Splits if exiting a level and loading the Special World map
    if(vars.currentScene.Current == 50){
        switch((int) vars.currentScene.Old){
            case 51: return vars.CheckTriangles(settings["split_kamelasa"], settings["split_triangles"]);
            case 52: return vars.CheckTriangles(settings["split_dimoplacy"], settings["split_triangles"]);
            case 53: return vars.CheckTriangles(settings["split_milagro"], settings["split_triangles"]);
            case 54: return vars.CheckTriangles(settings["split_minne"], settings["split_triangles"]);
            case 55: return vars.CheckTriangles(settings["split_bluegie_nights"], settings["split_triangles"]);
            case 56: return vars.CheckTriangles(settings["split_nayas_lair"], settings["split_triangles"]);
            case 57: return vars.CheckTriangles(settings["split_hel_verdoemenis"], settings["split_triangles"]);
            case 58: return vars.CheckTriangles(settings["split_syggelekokle"], settings["split_triangles"]);
            case 59: return vars.CheckTriangles(settings["split_stikling"], settings["split_triangles"]);
            case 60: return vars.CheckTriangles(settings["split_franz_jager"], settings["split_triangles"]);
            case 61: return vars.CheckTriangles(settings["split_erjingtino"], settings["split_triangles"]);
            case 62: return vars.CheckTriangles(settings["split_sally"], settings["split_triangles"]);
        }
    }
    // Splits when exiting Amalienborg, Slutet or Fin and loading the main menu 
    if(vars.currentScene.Current == 2){
        if(vars.currentScene.Old == 23){
            return vars.CheckTriangles(settings["split_amalienborg"], settings["split_triangles"]);
        }
        else if (vars.currentScene.Old == 48){
            return vars.CheckTriangles(settings["split_slutet"], settings["split_triangles"]);   
        }
        else if (vars.currentScene.Old == 63){
            return vars.CheckTriangles(settings["split_fin"], settings["split_triangles"]);   
        }
    }
    
    // Splits if loading a level while coming from the Story World map
    if(vars.currentScene.Old == 6){
        switch((int) vars.currentScene.Current){
            case 7: return settings["split_hub_botanisk_have"];
            case 8: return settings["split_hub_kastellet"];
            case 9: return settings["split_hub_valby"];
            case 10: return settings["split_hub_assistens_kirkegard"];
            case 11: return settings["split_hub_christiania"];
            case 12: return settings["split_hub_orstedsparken"];
            case 13: return settings["split_hub_sydhavnen"];
            case 14: return settings["split_hub_bella_center"];
            case 15: return settings["split_hub_vesterbro"];
            case 16: return settings["split_hub_klovermarken"];
            case 17: return settings["split_hub_kastrup"];
            case 18: return settings["split_hub_planetarium"];
            case 19: return settings["split_hub_tarnby"];
            case 20: return settings["split_hub_reffen"];
            case 21: return settings["split_hub_norrebroparken"];
            case 22: return settings["split_hub_amalienborg"];
        }
    }
    // Splits if loading a level while coming from the Bonus World map
    if(vars.currentScene.Old == 24){
        switch((int) vars.currentScene.Current){
            case 25: return settings["split_hub_struts"];
            case 26: return settings["split_hub_ekorre"];
            case 27: return settings["split_hub_snabel_a"];
            case 28: return settings["split_hub_fyrkant"];
            case 29: return settings["split_hub_fika"];
            case 30: return settings["split_hub_braket"];
            case 31: return settings["split_hub_sar_skrivning"];
            case 32: return settings["split_hub_katten"];
            case 33: return settings["split_hub_fuffens"];
            case 34: return settings["split_hub_vovven"];
            case 35: return settings["split_hub_oatit"];
            case 36: return settings["split_hub_namnlos"];
            case 37: return settings["split_hub_krokodil"];
            case 38: return settings["split_hub_grotslev"];
            case 39: return settings["split_hub_sill"];
            case 40: return settings["split_hub_triangel"];
            case 41: return settings["split_hub_stolen"];
            case 42: return settings["split_hub_pannkakan"];
            case 43: return settings["split_hub_koppen"];
            case 44: return settings["split_hub_bullen"];
            case 45: return settings["split_hub_ostroken"];
            case 46: return settings["split_hub_kotten"];
            case 47: return settings["split_hub_tack"];
            case 48: return settings["split_hub_slutet"];
        }
    }
    // Splits if loading a level while coming from the Special World map
    if(vars.currentScene.Old == 50){
        switch((int) vars.currentScene.Current){
            case 51: return settings["split_hub_kamelasa"];
            case 52: return settings["split_hub_dimoplacy"];
            case 53: return settings["split_hub_milagro"];
            case 54: return settings["split_hub_minne"];
            case 55: return settings["split_hub_bluegie_nights"];
            case 56: return settings["split_hub_nayas_lair"];
            case 57: return settings["split_hub_hel_verdoemenis"];
            case 58: return settings["split_hub_syggelekokle"];
            case 59: return settings["split_hub_stikling"];
            case 60: return settings["split_hub_franz_jager"];
            case 61: return settings["split_hub_erjingtino"];
            case 62: return settings["split_hub_sally"];
            case 63: return settings["split_hub_fin"];
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
    // Starts timer when loading either the Story or Bonus World from the main menu
    if((vars.currentScene.Old == 2 && vars.currentScene.Current == 6) || (vars.currentScene.Old == 2 && vars.currentScene.Current == 24)) {
        return true;
    }

    if(settings["start_il"]) {
        // Starts timer when loading either a Story or Bonus level from their respective maps
        if((vars.currentScene.Old == 6 && vars.currentScene.Current > 6) || (vars.currentScene.Old == 24 && vars.currentScene.Current > 24)) {
            return true;
        }
    }

    return false;
}
