state("Vectronom") {
	// Values found by badBlackShark

	int completed_levels : "UnityPlayer.dll", 0x01546C30, 0x128, 0x8, 0x38, 0x60, 0x100;
	int game_state       : "UnityPlayer.dll", 0x01546C30, 0x120, 0x0, 0x38, 0x60, 0x108;

	// alt
	// int game_state 		  : "UnityPlayer.dll", 0x01546C30, 0x128, 0x8, 0x38, 0x60, 0x108;
}

startup {
	// Any% splitting
	settings.Add("category_any", true, "Any% Splitting");
	settings.SetToolTip("category_any", "Auto-splitting for Any% runs.");
	// load removal
	settings.Add("load_removal", true, "Load Removal");
	settings.SetToolTip("load_removal", "Load Removal pauses the timer during loading zones.");
}

init {
	// We need this because the split action doesn't have old and current states.
	vars.need_split = false;
}

update {
	if(old.completed_levels < current.completed_levels) {
		vars.need_split = true;
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
