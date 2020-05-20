/// @arg cell_list
var _cell_list = argument[0];

var _len = ds_list_size(_cell_list);
var _index = irandom_range(0, _len-1);
var _choice = _cell_list[| _index];

ds_list_clear(_cell_list);
ds_list_add(_cell_list, _choice);