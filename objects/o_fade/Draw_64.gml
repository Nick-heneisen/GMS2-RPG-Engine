
if (transitioning_in) {
	
	if (alpha < 1) {
		draw_sprite_ext(s_transition, 0, 0, 0, window_width, window_height, 0, c_white, alpha);
		alpha += trans_time;
	}
	
	else {
		room_change(target_x, target_y, target_room);
		transitioning_in = false;
		transitioning_out = true;
	}
}

else if (transitioning_out) {
	if (alpha >= 0) {
		draw_sprite_ext(s_transition, 0, 0, 0, window_width, window_height, 0, c_white, alpha);
		alpha -= trans_time;
	}
	else {
		transitioning_out = false;
		tilemap_setup();
		o_player.state = PLAYERSTATE.IDLE;
		instance_destroy();
	}
}
	