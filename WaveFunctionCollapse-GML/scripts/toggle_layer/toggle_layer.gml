///@arg layer_id
///@arg visible

var _layer_id = argument[0];
var _visible = argument[1];

if (_visible) {
	instance_activate_layer(_layer_id);
} else {
	instance_deactivate_layer(_layer_id);
}

layer_set_visible(_layer_id, _visible);