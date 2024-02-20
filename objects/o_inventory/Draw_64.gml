//actual stuff
if (!transitioning_in && !transitioning_out) {
	if (!setup) {
	
		setup = true;
	
		//setup
		draw_set_font(global.font_main);
		draw_set_valign(fa_center);
		draw_set_halign(fa_center);
	}

	//draw box
	draw_sprite_ext(inv_sprite, 0, inv_x, inv_y, inv_width / inv_sprite_w, inv_height / inv_sprite_h, 0, c_white, 1);
	draw_sprite_ext(inv_sprite, 0, bottom_x, bottom_y, bottom_width / inv_sprite_w, bottom_height / inv_sprite_h, 0, c_white, 1);

	//draw inventory
	var _sus = curs_x + (curs_y * 2);
	inv_page = floor(_sus / 6);
	
	//draw arrow(s)
	inv_pages = global.InvSize / 6;
	if (inv_page + 1 < inv_pages) {
		draw_sprite(s_arrow_down, 0, (inv_width / 2) + 16, margin_y + inv_height - sprite_get_height(s_arrow_down))
	}
	
	if (inv_page + 1 > 1) {
		draw_sprite(s_arrow_up, 0, (inv_width / 2) + 16, margin_y + sprite_get_height(s_arrow_down))
	}
	
	
	var _start = (inv_page * 6);
	var _end = ((inv_page + 1) * 6);
	
	for (var _i = _start; _i < _end; _i++) {
		
		var _color = c_white;
		var _yellow = false;
		var _sprite = s_inventory_empty;
		var _x = 0;
		var _y = ((floor(_i / 2) - (inv_page * 3)) * sprite_get_height(_sprite)) + ((floor(_i / 2) - (inv_page * 3)) * margin_y);
		
		var _fartx = 0;
		var _farty = (floor(_i / 2));
		
		if (_i % 2 != 0) {
			_x = (sprite_get_width(_sprite) * 7.5) + margin_x;
			_fartx = 1;
		}

		//draw items 
		var _item = ds_grid_get(global.Inventory, _fartx, _farty)
		if (_item != undefined) {
			if (!instance_exists(_item)) show_debug_message("ERROR: OBJECT NOT IN ROOM."); else
			draw_sprite_ext(_item.sprite_index, 0, inv_x + margin_x + _x + icon_margin, inv_y + margin_y + _y, 2, 2, 0, c_white, 1);
			draw_text(inv_x + margin_x + _x + icon_margin + (_item.sprite_width * 2) + text_margin, inv_y + margin_y + _y + 12, _item.item_name);
		}
		
		//draw bottom box
		var _selected = ds_grid_get(global.Inventory, curs_x, curs_y)
		if (_item != undefined) {
			if (instance_exists(_item)) {
				//draw_sprite_ext(inv_sprite, 0, bottom_x, bottom_y, bottom_width / inv_sprite_w, bottom_height / inv_sprite_h, 0, c_white, 1);
				if (_selected != undefined) draw_text(bottom_x + (inv_width / 2), bottom_y + margin_y + desc_margin, _selected.description);
				
				if (selected) {
					for (var _j = 0; _j < op_length; _j++) {
						
						var _c = c_white;
						if (_j != 0) bottom_h_inbetween = (string_length(option[_j - 1]) * 2) + 48;
						if (pos == _j) _c = c_yellow;
						draw_text_color(bottom_x + (bottom_width / (op_length + 1) * (_j + 1)), bottom_y + (bottom_height / 2) + 6, option[_j], _c, _c, _c, _c, 1);
					}
				}
			}
		}

		//pick the right sprite
		
		if (_sus == _i) _yellow = true;
		if (_yellow) {
			if (ds_grid_get(global.Inventory, _fartx, _farty)) != undefined {
				_sprite = s_inventory_full_y;
			} else {
				_sprite = s_inventory_empty_y;
			}
		} else {
			if (ds_grid_get(global.Inventory, _fartx, _farty)) != undefined {
				_sprite = s_inventory_full;
			} else {
				_sprite = s_inventory_empty;
			}
		}
		
		draw_sprite_ext(_sprite, 0, inv_x + margin_x + _x, inv_y + margin_y + _y, 7.5, 1, 0, c_white, 1);
		
	}
		
}


//transitioning shart
else if (transitioning_out) {
	if (trans_clock > 0) {
		var _curr_width = inv_sprite_w * trans_clock;
		//var _curr_height = inv_sprite_h * trans_clock;
		draw_sprite_ext(inv_sprite, 1, (inv_x + (inv_width / 2) - (_curr_width / 2)), inv_y, trans_clock, target_h, 0, c_white, 1);
		draw_sprite_ext(inv_sprite, 1, (bottom_x + (bottom_width / 2) - (_curr_width / 2)), bottom_y, trans_clock, target_h_bot, 0, c_white, 1);

		trans_clock -= t_time;

	}
	else {
		instance_destroy();
		o_player.state = PLAYERSTATE.IDLE;
	}
}

else if (transitioning_in) {
	
	if (trans_clock < target_w) {
		var _curr_width = inv_sprite_w * trans_clock;
		draw_sprite_ext(inv_sprite, 1, (inv_x + (inv_width / 2) - (_curr_width / 2)), inv_y, trans_clock, target_h, 0, c_white, 1);
		draw_sprite_ext(inv_sprite, 1, (bottom_x + (bottom_width / 2) - (_curr_width / 2)), bottom_y, trans_clock, target_h_bot, 0, c_white, 1);		
		trans_clock += t_time;

	}
	else {
		transitioning_in = false;
		trans_clock = target_w;
		draw_sprite_ext(inv_sprite, 1, inv_x, inv_y, inv_width/inv_sprite_w, inv_height/inv_sprite_h, 0, c_white, 1);
		draw_sprite_ext(inv_sprite, 1, bottom_x, bottom_y, bottom_width/inv_sprite_w, bottom_height/inv_sprite_h, 0, c_white, 1);

	}
}