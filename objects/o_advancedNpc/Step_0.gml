//alarm used so text isnt skipped same frame as it's made.
if (dialoguing == true) {
	if (firstTime) {
		alarm[1] = 1;
		alarm[2] = 1;
		firstTime = false;
	} else {
		alarm[0] = 1;
		
		alarm[2] = 1;
	}
}