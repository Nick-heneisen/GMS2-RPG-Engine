
if (state == PLAYERSTATE.WALKING) {
	walk_anim_time += delta_time / 1000000;
	
	var _t = walk_anim_time / walk_anim_length;
	
	if (_t >= 1) {
		walk_anim_time = 0;
		_t = 1;
		state = PLAYERSTATE.IDLE;
	}
	
	var _x = lerp(x_from, x_to, _t);
	var _y = lerp(y_from, y_to, _t);
	
	x = _x * TILE_WIDTH;
	y = _y * TILE_HEIGHT;
	
	image_index = frames[floor((walk_anim_frames - 1) * _t)];
	
}

if (sprite_index = s_player_down) facing = DIRECTION.DOWN;
if (sprite_index = s_player_up) facing = DIRECTION.UP;
if (sprite_index = s_player_left) facing = DIRECTION.LEFT;
if (sprite_index = s_player_right) facing = DIRECTION.RIGHT;