
if (!transitioning_in && !transitioning_out) {
	if (!setup) {
	
		setup = true;
	
		//setup
		draw_set_font(global.font_main);
		draw_set_valign(fa_bottom);
		draw_set_halign(fa_center);
	}

	//draw box
	draw_sprite_ext(menu_sprite, 0, menu_x, menu_y, menu_width / menu_sprite_w, menu_height / menu_sprite_h, 0, c_white, 1);

	//draw text
	for (var _i = 0; _i < op_length; _i++) {
	
		var _c = c_white;
		if (_i != 0) menu_h_inbetween = (string_length(option[menu_level, _i - 1]) * 2) + 48;
		if (pos == _i) _c = c_yellow;
		draw_text_color(menu_x + (menu_width / (op_length + 1) * (_i + 1)), menu_y + (menu_height / 2) + 6, option[menu_level, _i], _c, _c, _c, _c, 1);
	
	}
}

else if (transitioning_out) {
	if (trans_clock > 0) {
		var _curr_width = menu_sprite_w * trans_clock;
		draw_sprite_ext(menu_sprite, 1, (menu_x + (menu_width / 2) - (_curr_width / 2)), menu_y, trans_clock, target_h, 0, c_white, 1);
		trans_clock -= t_time;

	}
	else {
		instance_destroy();
		o_player.state = PLAYERSTATE.IDLE;
	}
}

else if (transitioning_in) {
	
	if (trans_clock < target_w) {
		var _curr_width = menu_sprite_w * trans_clock;
		draw_sprite_ext(menu_sprite, 1, (menu_x + (menu_width / 2) - (_curr_width / 2)), menu_y, trans_clock, target_h, 0, c_white, 1);
		trans_clock += t_time;

	}
	else {
		transitioning_in = false;
		trans_clock = target_w;
		draw_sprite_ext(menu_sprite, 1, menu_x, menu_y, menu_width/menu_sprite_w, menu_height/menu_sprite_h, 0, c_white, 1);

	}
}
