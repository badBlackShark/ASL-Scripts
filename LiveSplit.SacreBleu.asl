state("MusketeerGame-Win64-Shipping") {
}

startup {
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Basic");

    settings.Add("tutorial_split", true, "Split tutorial separately");
    settings.SetToolTip("tutorial_split", "Split the timer when entering the first level after the tutorial. \n" +
                        "If not selected, the timer will continue to run until the first real level is completed.");

    settings.Add("load_removal", true, "Load Removal");
    settings.SetToolTip("load_removal", "Stop the timer when the game is paused or loading");

    settings.Add("combat_deductions", true, "Combat Deductions", "load_removal");
    settings.SetToolTip("combat_deductions", "Take combat deductions into account when timing the game");

    settings.Add("deaths_per_run", false, "Track Deaths per Run");
    settings.SetToolTip("deaths_per_run", "Tracks the amount of times you died this run. Resets when you go to the main menu. \n" +
                        "The necessary text component is added to your layout automatically when you restart LiveSplit or die for the first time.");

    settings.Add("deaths_per_level", false, "Track Deaths per Level");
    settings.SetToolTip("deaths_per_level", "Tracks the amount of times you died this level. Resets when you exit any given level. \n" +
                        "The necessary text component is added to your layout automatically when you restart LiveSplit or die for the first time.");

    vars.combinedGameTime = 0;

    if (timer.CurrentTimingMethod == TimingMethod.RealTime){
        var message = MessageBox.Show(
            "Would you like to change the current timing method to\nGame Time instead of Real Time?",
            "LiveSplit | Sacre Bleu Auto Splitter", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

        if (message == DialogResult.Yes){
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }
}

// Crafted with the loving help of https://github.com/just-ero
init {
    if (settings["deaths_per_run"]) {
        vars.Helper.Texts["deaths_per_run"] = vars.Helper.Texts.Find("Deaths this Run:");
        vars.Helper.Texts["deaths_per_run"].Left = "Deaths this Run:";
        vars.Helper.Texts["deaths_per_run"].Right = 0;
    }

    if (settings["deaths_per_level"]) {
        vars.Helper.Texts["deaths_per_level"] = vars.Helper.Texts.Find("Deaths this Level:");
        vars.Helper.Texts["deaths_per_level"].Left = "Deaths this Level:";
        vars.Helper.Texts["deaths_per_level"].Right = 0;
    }

    print("[Sacre Bleu Autosplitter] Scanning memory");

    var magic = BitConverter.GetBytes(211111111ul);
    var trg = new SigScanTarget(0, magic);

    IntPtr lsTracker = IntPtr.Zero;
    foreach (var page in game.MemoryPages(true)) {
        var scn = new SignatureScanner(game, page.BaseAddress, (int)page.RegionSize);
        lsTracker = scn.Scan(trg);

        if (lsTracker != IntPtr.Zero) {
            break;
        }
    }

    if (lsTracker == IntPtr.Zero) {
        throw new Exception("Magic number not found.");
    }

    print("[Sacre Bleu Autosplitter] Scanning successful");

    vars.Helper["gameTime"] = vars.Helper.Make<int>(lsTracker + 0x08);
    vars.Helper["levelId"] = vars.Helper.Make<int>(lsTracker + 0x28);
    vars.Helper["levelFinishedLoading"] = vars.Helper.Make<int>(lsTracker + 0x2C);
    vars.Helper["deathsThisRun"] = vars.Helper.Make<int>(lsTracker + 0x128);
    vars.Helper["deathsThisLevel"] = vars.Helper.Make<int>(lsTracker + 0x12C);
    vars.Helper["levelsCompletedOnCurrentSave"] = vars.Helper.Make<int>(lsTracker + 0x140);
}

update {
    vars.Helper.Update();
    vars.Helper.MapPointers();

    if(settings["deaths_per_run"]) {
        if(vars.Helper["deathsThisRun"].Old != vars.Helper["deathsThisRun"].Current) {
            vars.Helper.Texts["deaths_per_run"].Right = vars.Helper["deathsThisRun"].Current;
        }
    }

    if(settings["deaths_per_level"]) {
        if(vars.Helper["deathsThisLevel"].Old != vars.Helper["deathsThisLevel"].Current) {
            vars.Helper.Texts["deaths_per_level"].Right = vars.Helper["deathsThisLevel"].Current;
        }
    }
}

start {
    if(vars.Helper["levelId"].Old == 22 && vars.Helper["levelId"].Current == 21 && vars.Helper["levelsCompletedOnCurrentSave"].Current == 0) {
        return true;
    }
}

split {
    if(settings["tutorial_split"] &&
       vars.Helper["levelsCompletedOnCurrentSave"].Current == 0 &&
       vars.Helper["levelId"].Old == 21 &&
       vars.Helper["levelId"].Current == 0) {
        return true;
      }

    if(vars.Helper["levelsCompletedOnCurrentSave"].Current > vars.Helper["levelsCompletedOnCurrentSave"].Old) {
        return true;
    }
}

isLoading {
    if(settings["load_removal"]){
        return vars.Helper["gameTime"].Old == vars.Helper["gameTime"].Current;//--*-+
    }
}

gameTime {
    print(vars.combinedGameTime.ToString());
    if(settings["combat_deductions"]){
        if(vars.Helper["levelFinishedLoading"].Old == 0 && vars.Helper["levelFinishedLoading"].Current == 1) {
            vars.combinedGameTime += vars.Helper["gameTime"].Old;
        }

        return (TimeSpan.FromMilliseconds(vars.combinedGameTime + vars.Helper["gameTime"].Current));
    }
}

onStart {
    vars.combinedGameTime = 0;
}

onReset {
    vars.combinedGameTime = 0;
}
