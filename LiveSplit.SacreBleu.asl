state("MusketeerGame-Win64-Shipping") {
}

startup {
    vars.scanTarget = new SigScanTarget(0,
        "C7 4C 95 0C 00 00 00 00 ?? ?? ?? ?? 00 00 00 00 00 00 00 00 00 00 00 00",
        "?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 00 00 00 00 00 00 00"
    );

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
    vars.TextRunDeathCounter = null;
    vars.TextLevelDeathCounter = null;

    vars.UpdateRunDeathCounter = (Action)(() => {
        if(vars.TextRunDeathCounter == null) {
            foreach (dynamic component in timer.Layout.Components) {
                if (component.GetType().Name != "TextComponent") continue;

                if (component.Settings.Text1 == "Deaths This Run:"){
                    vars.TextRunDeathCounter = component.Settings;
                    break;
                }
            }

            if(vars.TextRunDeathCounter == null) {
                vars.TextRunDeathCounter = vars.CreateTextComponent("Deaths This Run:");
            }
        }

        vars.TextRunDeathCounter.Text2 = vars.deathsThisRun.Current.ToString();
    });

    vars.UpdateLevelDeathCounter = (Action)(() => {
        if(vars.TextLevelDeathCounter == null) {
            foreach (dynamic component in timer.Layout.Components) {
                if (component.GetType().Name != "TextComponent") continue;

                if (component.Settings.Text1 == "Deaths This Level:"){
                    vars.TextLevelDeathCounter = component.Settings;
                    break;
                }
            }

            if(vars.TextLevelDeathCounter == null) {
                vars.TextLevelDeathCounter = vars.CreateTextComponent("Deaths This Level:");
            }
        }

        vars.TextLevelDeathCounter.Text2 = vars.deathsThisLevel.Current.ToString();
    });

    vars.CreateTextComponent = (Func<string, dynamic>)((name) => {
        var textComponentAssembly = Assembly.LoadFrom("Components\\LiveSplit.Text.dll");
        dynamic textComponent = Activator.CreateInstance(textComponentAssembly.GetType("LiveSplit.UI.Components.TextComponent"), timer);
        timer.Layout.LayoutComponents.Add(new LiveSplit.UI.Components.LayoutComponent("LiveSplit.Text.dll", textComponent as LiveSplit.UI.Components.IComponent));
        textComponent.Settings.Text1 = name;
        return textComponent.Settings;
    });
}

// Adapted from https://github.com/CryZe/AHatInTimeAutoSplitter/blob/master/AHatInTime.asl
init {
    vars.threadScan = new Thread(() => {
        while(true) {
            var ptr = IntPtr.Zero;

            print("[Sacre Bleu Autosplitter] Scanning memory");
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
                print("[Sacre Bleu Autosplitter] Scanning unsuccessful");
                Thread.Sleep(1000);
                continue;
            }

            print("[Sacre Bleu Autosplitter] Scanning successful");

            vars.gameTime = new MemoryWatcher<int>(ptr + 0x08);
            vars.levelId = new MemoryWatcher<int>(ptr + 0x28);
            vars.levelFinishedLoading = new MemoryWatcher<int>(ptr + 0x2C);
            vars.deathsThisRun = new MemoryWatcher<int>(ptr + 0x128);
            vars.deathsThisLevel = new MemoryWatcher<int>(ptr + 0x12C);
            vars.levelsCompletedOnCurrentSave = new MemoryWatcher<int>(ptr + 0x140);

            vars.watchers = new MemoryWatcherList() {
                vars.gameTime,
                vars.levelId,
                vars.levelFinishedLoading,
                vars.deathsThisRun,
                vars.deathsThisLevel,
                vars.levelsCompletedOnCurrentSave
            };

            vars.watchers.UpdateAll(game);
            print("[Sacre Bleu Autosplitter] Done scanning");
            print(vars.gameTime.Current.ToString());


            if (settings["deaths_per_run"]) {
                vars.UpdateRunDeathCounter();
            }

            if (settings["deaths_per_level"]) {
                vars.UpdateLevelDeathCounter();
            }

            break;
        }
    });
    vars.threadScan.Start();

    if (timer.CurrentTimingMethod == TimingMethod.RealTime){
        var message = MessageBox.Show(
            "Would you like to change the current timing method to\nGame Time instead of Real Time?",
            "LiveSplit | Sacre Bleu Auto Splitter", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

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

    if(vars.levelFinishedLoading.Old == 0 &&
       vars.levelFinishedLoading.Current == 1 &&
       timer.CurrentPhase == TimerPhase.Running){
            vars.combinedGameTime += vars.gameTime.Old;
    }

    if(settings["deaths_per_run"]) {
        if(vars.deathsThisRun.Old != vars.deathsThisRun.Current) {
            vars.UpdateRunDeathCounter();
        }
    }

    if(settings["deaths_per_level"]) {
        if(vars.deathsThisLevel.Old != vars.deathsThisLevel.Current) {
            vars.UpdateLevelDeathCounter();
        }
    }
}

start {
    if(vars.levelId.Old == 22 && vars.levelId.Current == 21 && vars.levelsCompletedOnCurrentSave.Current == 0) {
        return true;
    }
    return false;
}

split {
    if(vars.levelsCompletedOnCurrentSave.Current > vars.levelsCompletedOnCurrentSave.Old) {
        return true;
    }

    return false;
}

isLoading {
    if(settings["load_removal"]){
        return vars.gameTime.Old == vars.gameTime.Current;
    }
}

gameTime {
    if(settings["combat_deductions"]){
        return (TimeSpan.FromMilliseconds(vars.combinedGameTime + vars.gameTime.Current));
    }
}

onStart {
    vars.combinedGameTime = 0;
}
