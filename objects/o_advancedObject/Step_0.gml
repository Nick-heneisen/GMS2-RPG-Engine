//alarm used so text isnt skipped same frame as it's made.
if (dialoguing == true) {
	if (global.CurrItem == o_stick && !itemUsed) {
		alarm[1] = 1;
		sprite_index = s_itemTesterFull;
		
		itemUsed = true;
		remove_item(o_stick);
		global.CurrItem = undefined;
		
	} else if (!itemUsed) {
		alarm[0] = 1;
	} else {
		alarm[2] = 1;
	}
}