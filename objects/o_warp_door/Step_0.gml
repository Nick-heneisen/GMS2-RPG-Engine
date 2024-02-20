if (dialoguing == true) {
	
	dialoguing = false;
	
	o_player.state = PLAYERSTATE.BUSY;
	
	with (instance_create_layer(0, 0, "Instances", o_fade)) {
		target_x = other.target_x;
		target_y = other.target_y;
		target_room = other.target_room;
		transitioning_in = true;
	}
}