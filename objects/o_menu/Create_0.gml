//whether menu has set up or not
setup = false;

//menu sprite settings
menu_sprite = s_dialogue_box;
menu_image = 0;
menu_image_speed = 0;

//menu sprite magic nums
menu_width = 576;
menu_height = 112;
menu_sprite_w = sprite_get_width(menu_sprite);
menu_sprite_h = sprite_get_height(menu_sprite);
target_w = menu_width / menu_sprite_w;
target_h = menu_height / menu_sprite_h;

//menu magic nums
menu_border = 24;
menu_h_inbetween = 0;

//cursor position
pos = 0;

//level 0
option[0, 0] = "Settings";
option[0, 1] = "Quit";

//level 1
option[1, 0] = "Fullscreen: " + string(window_get_fullscreen());
option[1, 1] = "Music: " + string(global.MusicVolume);
option[1, 2] = "SFX: " + string(global.SFXVolume);
option[1, 3] = "Back";

//general settings
op_length = 0;
menu_level = 0;

//basic placement of menu
menu_x = 16;
menu_y = 16;

close_key = false;

//trans
transitioning_in = true;
transitioning_out = false;
trans_clock = 1;

//transition time, higher is faster
t_time = 3;