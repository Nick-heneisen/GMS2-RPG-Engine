
/**
 *  Function Description
 * @param {Array} _text_array  Array of page of words.
 * @param [Sprite] _avatar     avatar sprite ID.
 */
function dialogue_box_open(_text_array, _avatar=undefined) {
	
	with instance_create_layer(0, 0, "Instances", o_textbox) {
		avatar = _avatar;
		text = _text_array;
	}
	
}

function menu_open() {
	instance_create_layer(0, 0, "Instances", o_menu);
}

function inventory_open() {
	instance_create_layer(0, 0, "Instances", o_inventory);
}

function set_text_defaults() {
	line_break_pos[0, page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
}