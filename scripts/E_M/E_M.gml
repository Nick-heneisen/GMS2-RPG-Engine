gml_pragma("global", "E_M()");

enum PLAYERSTATE {
	IDLE,
	WALKING,
	BUSY
}

enum DIRECTION {
	RIGHT,
	UP,
	LEFT,
	DOWN
}
	
#macro TILE_WIDTH 32
#macro TILE_HEIGHT 32

global.components = [];
global.components[DIRECTION.RIGHT] = [1, 0];
global.components[DIRECTION.LEFT] = [-1, 0];
global.components[DIRECTION.UP] = [0, -1];
global.components[DIRECTION.DOWN] = [0, 1];

display_set_gui_size(608, 480);

