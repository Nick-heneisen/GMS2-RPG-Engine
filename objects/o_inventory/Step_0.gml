
//get inputs
var _right_key = keyboard_check_pressed(vk_right);
var _left_key = keyboard_check_pressed(vk_left);
var _up_key = keyboard_check_pressed(vk_up);
var _down_key = keyboard_check_pressed(vk_down);
var _accept_key = keyboard_check_pressed(ord("Z"));
alarm[0] = 1;

//navigate inv left/right
if (!selected) {
	curs_x += _right_key - _left_key;
	if (curs_x >= ds_grid_width(global.Inventory)) curs_x = 0;
	if (curs_x < 0) curs_x = ds_grid_width(global.Inventory) - 1;

	//nagivate inv up/down
	curs_y += _down_key - _up_key;
	if (curs_y >= ds_grid_height(global.Inventory)) {
		curs_y = ds_grid_height(global.Inventory) - 1;
		//curs_y = 0;
	}
	
	if (curs_y < 0) {
		curs_y = 0
		//curs_y = ds_grid_height(global.Inventory) - 1;
	}
}

//when buttons selected
if _accept_key {
	if (!selected) {
		if (ds_grid_get(global.Inventory, curs_x, curs_y) != undefined) {
			selected = true;
		}
		
	} else {
		switch (pos) {
			case 0: 
				global.CurrItem = ds_grid_get(global.Inventory, curs_x, curs_y);
				selected = false;
				break;
			case 1:
				remove_item(ds_grid_get(global.Inventory, curs_x, curs_y));
				selected = false;
				break;
		}
	}
}

if (selected) {
	pos += _right_key - _left_key;
	if (pos >= op_length) pos = 0;
	if (pos < 0) pos = op_length - 1;
}

if (item_using) {
	global.CurrItem = ds_grid_get(global.Inventory, curs_x, curs_y);
	
}

if (close_key) {
	if (!selected) {
		transitioning_out = true;
	} else {
		selected = false;
	}
}