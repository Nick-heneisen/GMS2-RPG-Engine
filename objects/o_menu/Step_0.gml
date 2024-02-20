//get inputs
var _right_key = keyboard_check_pressed(vk_right);
var _left_key = keyboard_check_pressed(vk_left);
var _accept_key = keyboard_check_pressed(ord("Z"));
alarm[0] = 1;

//navigate menu
pos += _right_key - _left_key;
if (pos >= op_length) pos = 0;
if (pos < 0) pos = op_length - 1;

//recheck length
op_length = array_length(option[menu_level]);

//when buttons selected
if _accept_key {
	
	var _level = menu_level;
	//pause menu
	switch(menu_level) {
		case 0: 
			switch (pos) {
				//go to settings menu
				case 0: menu_level = 1; break;
				//quit
				case 1: game_end(); break;
			}
		break;
		
		case 1:
			switch (pos) {
				//fullscreen
				case 0: window_set_fullscreen(!window_get_fullscreen());
					option[1, 0] = "Fullscreen: " + string(window_get_fullscreen());
				break;
				//music
				case 1: break;
				//sfx
				case 2: break;
				//back
				case 3: menu_level = 0; break;
			}
		break;
	}
	
	if _level != menu_level {pos = 0;}
	op_length = array_length(option[menu_level]);
}

//when specific buttons hovered over
switch(menu_level) {
	case 0: 

	break;
		
	case 1:
		switch (pos) {
			//music
			case 1:
				if keyboard_check(vk_down) {
					global.MusicVolume = clamp(global.MusicVolume - 1, 0, 100);
					option[1, 1] = "Music: " + string(global.MusicVolume);
				} else if keyboard_check(vk_up) {
					global.MusicVolume = clamp(global.MusicVolume + 1, 0, 100);
					option[1, 1] = "Music: " + string(global.MusicVolume);
				}
				
				break;
			//sfx
			case 2:
				if keyboard_check(vk_down) {
					global.SFXVolume = clamp(global.SFXVolume - 1, 0, 100);
					option[1, 2] = "SFX: " + string(global.SFXVolume);
				} else if keyboard_check(vk_up) {
					global.SFXVolume = clamp(global.SFXVolume + 1, 0, 100);
					option[1, 2] = "SFX: " + string(global.SFXVolume);
				}
			break;
		}
	break;
}

if (close_key) {
	transitioning_out = true;
}