
function player_controller(_dir) {
	
	var _components = global.components[_dir];
	var _dx = _components[0];
	var _dy = _components[1];
	
	if (state == PLAYERSTATE.IDLE) {
		
		//var wall_tile_layer = layer_get_id("Walls");
		//wall_tile_map = layer_tilemap_get_id(wall_tile_layer);

		//var inter_tile_layer = layer_get_id("Interactables_tiles");
		//inter_tile_map = layer_tilemap_get_id(inter_tile_layer);
		
		if (!tilemap_get(wall_tile_map, x_pos + _dx, y_pos + _dy) && (!tilemap_get(inter_tile_map, x_pos + _dx, y_pos + _dy))) {
			x_from = x_pos;
			y_from = y_pos;
		
			x_to = x_pos + _dx;
			y_to = y_pos + _dy;
		
			x_pos = x_to;
			y_pos = y_to;
		
			state = PLAYERSTATE.WALKING;
			sprite_index = sprite[_dir];
			//facing = sprite[sprite_index];
			
		} else {
			
			sprite_index = sprite[_dir];
			//facing = sprite[sprite_index];
		}
	}
	
}


/**
 * Function Description
 * @param {Real} _target_x Target x value of player.
 * @param {Real} _target_y Target y value of player.
 * @param {Asset.GMRoom} _target_room Room to change to.
 */
function room_change(_target_x, _target_y, _target_room) {
	
	with o_player {
		x = _target_x;
		y = _target_y;
	
		x_pos = x / TILE_WIDTH;
		y_pos = y / TILE_HEIGHT;
		
		room_goto(_target_room);
		
		var wall_tile_layer = layer_get_id("Walls");
		wall_tile_map = layer_tilemap_get_id(wall_tile_layer);

		var inter_tile_layer = layer_get_id("Interactables_tiles");
		inter_tile_map = layer_tilemap_get_id(inter_tile_layer);
		
	}

}

function tilemap_setup() {
	with o_player {
		var _wall_tile_layer = layer_get_id("Walls");
		wall_tile_map = layer_tilemap_get_id(_wall_tile_layer);

		var _inter_tile_layer = layer_get_id("Interactables_tiles");
		inter_tile_map = layer_tilemap_get_id(_inter_tile_layer);
	}
}