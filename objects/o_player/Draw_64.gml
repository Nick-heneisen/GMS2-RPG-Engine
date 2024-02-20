
//draw item in top left when active
if (global.CurrItem != undefined) {
	var _sprite_x = camera_get_view_width(view_camera[0]) - (global.CurrItem.sprite_width * 2) - global.CurrItem.sprite_width;
	var _sprite_y = global.CurrItem.sprite_height;
	draw_sprite_ext(global.CurrItem.sprite_index, 0, _sprite_x, _sprite_y, 2, 2, 0, c_white, 1);
}