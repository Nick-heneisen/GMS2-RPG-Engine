
x_to = 0;
y_to = 0;

state = PLAYERSTATE.IDLE;

x_pos = x / TILE_WIDTH;
y_pos = y / TILE_HEIGHT;

x_from = x_pos;
y_from = y_pos;

walk_anim_length = 0.3;
walk_anim_time = 0;

image_speed = 0;
image_index = 1;

frames = [1, 0, 1, 2, 1];
walk_anim_frames = 5

sprite[DIRECTION.RIGHT] = s_player_right;
sprite[DIRECTION.LEFT] = s_player_left;
sprite[DIRECTION.UP] = s_player_up;
sprite[DIRECTION.DOWN] = s_player_down;
facing = undefined;

var _wall_tile_layer = layer_get_id("Walls");
wall_tile_map = layer_tilemap_get_id(_wall_tile_layer);

var _inter_tile_layer = layer_get_id("Interactables_tiles");
inter_tile_map = layer_tilemap_get_id(_inter_tile_layer);