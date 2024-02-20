global.font_main = font_add_sprite(s_font, 32, true, 2);
global.SFXVolume = 100;
global.MusicVolume = 100;
global.CurrItem = undefined;

//INVENTORY SETUP
global.Inventory = ds_grid_create(2, 3);
ds_grid_set_region(global.Inventory, 0, 0, ds_grid_width(global.Inventory), ds_grid_height(global.Inventory), undefined);
global.InvSize = ds_grid_width(global.Inventory) * ds_grid_height(global.Inventory);

show_debug_overlay(true);

room_goto_next();