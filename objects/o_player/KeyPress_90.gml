var _dir = facing;
var _components = global.components[_dir];
var _dx = _components[0];
var _dy = _components[1];

//if interacting with interactable tile, get tile properties and open textbox
if (tilemap_get(inter_tile_map, x_pos + _dx, y_pos + _dy) && state == PLAYERSTATE.IDLE) {

	var _interacting_with = collision_point((x + 16) + _dx * 32, (y + 16) + _dy * 32, all, false, true);
	
	if _interacting_with != noone {
		//if (_interacting_with.firstTime == false) {
		//	_interacting_with.firstTime = true;
		//}
		if (_interacting_with.dialoguing == false) {
			_interacting_with.dialoguing = true;
			state = PLAYERSTATE.BUSY;
		}
		
	} else {
		show_debug_message("ERROR: No object attatched to interactable!");
	}
}
