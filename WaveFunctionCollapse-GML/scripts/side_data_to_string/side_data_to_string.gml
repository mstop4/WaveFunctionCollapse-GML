/// @arg side_data

var _side_data = argument[0];
var _len = ds_list_size(_side_data);
var _str = "";

for (var i=0; i<_len; i++) {
	_str += string(_side_data[| i]) + (i < _len-1 ? ", " : "");
}

return _str;