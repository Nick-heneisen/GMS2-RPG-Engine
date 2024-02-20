function get_item_count() {
	var _count = 0;
	for (var _i = 0; _i < ds_grid_width(global.Inventory); _i++) {
		for (var _j = 0; _j < ds_grid_height(global.Inventory); _j++) {
			if (ds_grid_get(global.Inventory, _i, _j) != undefined) _count++;
		}
	}
	return _count;
}

function give_item(_item) {
	
	//show grid
	//show_debug_message("----------------------");
	//show_debug_message("item count: " + string(get_item_count()));
	for (var _x = 0; _x < ds_grid_width(global.Inventory); _x++) {
		for (var _y = 0; _y < ds_grid_height(global.Inventory); _y++) {
			//show_debug_message("(" + string(_x) + "," + string(_y) + "): " + string(ds_grid_get(global.Inventory, _x, _y)));
		}
	}
	
	if (!instance_exists(_item)) instance_create_layer(0, 0, "Instances", _item);
	
	if (get_item_count() == global.InvSize) {
		ds_grid_resize(global.Inventory, ds_grid_width(global.Inventory), ds_grid_height(global.Inventory)*2);
		ds_grid_set_region(global.Inventory, 0, ds_grid_height(global.Inventory)/2, ds_grid_width(global.Inventory), ds_grid_height(global.Inventory) - 1, undefined);
		update_size();		
	}
	
	var _curr_size = global.InvSize;
	for (var _i = 0; _i < _curr_size; _i++) {
		
		var _fartx = 0;
		var _farty = (floor(_i / 2));
		
		if (_i % 2 != 0) {
			_fartx = 1;
		}
		
		if (ds_grid_get(global.Inventory, _fartx, _farty) == undefined) {
			ds_grid_set(global.Inventory, _fartx, _farty, _item);
			
			return;
		}
	}
}

function remove_item(_item) {
	if (get_item_count() == 0) { show_debug_message("ERROR: NO ITEMS!") return; }
	for (var _i = global.InvSize - 1; _i >= 0; _i--) {
		
		var _fartx = 0;
		var _farty = (floor(_i / 2));
		
		if (_i % 2 != 0) {
			_fartx = 1;
		}
		
		if (ds_grid_get(global.Inventory, _fartx, _farty) == _item) {
			ds_grid_set(global.Inventory, _fartx, _farty, undefined);
			sort_inventory();
			
			return;
		}
	}
}

function sort_inventory(_start = 0) {
	var _found = false;
	for (var _i = _start; _i < global.InvSize; _i++) {
		
		var _fartx = 0;
		var _farty = (floor(_i / 2));
		
		if (_i % 2 != 0) {
			_fartx = 1;
		}
		
		if (_found) {
			
			//previous number
			var __fartx = 0;
			var __farty = (floor((_i - 1) / 2));
		
			if ((_i - 1) % 2 != 0) {
				__fartx = 1;
			}
			
			ds_grid_set(global.Inventory, __fartx, __farty, ds_grid_get(global.Inventory, _fartx, _farty))
			ds_grid_set(global.Inventory, _fartx, _farty, undefined)
		}
		
		if (ds_grid_get(global.Inventory, _fartx, _farty) == undefined) {
			_found = true;
		}
		
	}
}

function update_size() {
	global.InvSize = ds_grid_width(global.Inventory) * ds_grid_height(global.Inventory);
}