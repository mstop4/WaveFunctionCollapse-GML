/// @arg cell_list
var _cell_list = argument[0];

var _len = ds_list_size(_cell_list);
var _total_weight = 0;
var _weights = ds_queue_create();
var _tiles = tile_data[? "tiles"];

for (var i=0; i<_len; i++) {
	var _cur_tile = _tiles[| _cell_list[| i]];
	//var _tile_id = _cur_tile[? "tileId"];
	
	//if (ds_list_find_index(exclusion_list, _tile_id) == -1) {
		ds_queue_enqueue(_weights, _cur_tile[? "weight"]);
		_total_weight += _cur_tile[? "weight"];	
	//}
}

var _roll = random_range(0, _total_weight);
var _index = 0;

while (_roll > ds_queue_head(_weights)) {
	_index++;
	_roll -= ds_queue_dequeue(_weights);
}

var _choice = _cell_list[| _index];

ds_list_clear(_cell_list);
ds_list_add(_cell_list, _choice);

if (track_errors) {
	var _tile_data = _tiles[| _choice];
	var _transforms = _tile_data[? "transforms"];

	last_collapse_tile_id = _tile_data[? "tileId"];
	last_collapse_tile_data = 0;
	last_collapse_tile_data = tile_set_rotate(last_collapse_tile_data, _transforms & 1);
	last_collapse_tile_data = tile_set_flip(last_collapse_tile_data, _transforms & 2);
	last_collapse_tile_data = tile_set_mirror(last_collapse_tile_data, _transforms & 4);
}

ds_queue_destroy(_weights);