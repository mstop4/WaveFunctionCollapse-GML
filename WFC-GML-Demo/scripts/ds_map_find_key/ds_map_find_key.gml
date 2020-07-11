/// @arg id
/// @arg value

var _id = argument[0];
var _value = argument[1];

var _key = ds_map_find_first(_id);

while (_id[? _key] != _value) {
	_key = ds_map_find_next(_id, _key);
}

return !is_undefined(_key) ? _key : "";