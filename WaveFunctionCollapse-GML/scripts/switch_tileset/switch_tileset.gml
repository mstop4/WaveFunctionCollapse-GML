/// @arg demo_id
/// @arg tileset_selector_id
/// @arg index

var _demo_id = argument[0];
var _tileset_selector_id = argument[1];
var _index = argument[2];

var _tilesets = _tileset_selector_id.tileset_data[? "tilesets"];
var _tileset = _tilesets[| _index];

with (_tileset_selector_id) {
	tileset_preview = asset_get_index(_tileset[? "tilePreview"]);
	tileset_name = _tileset[? "name"];
	tileset_index = asset_get_index(_tileset[? "tilesetIndex"]);
}

with (_demo_id) {
	tile_width = _tileset[? "tileWidth"];
	tile_height = _tileset[? "tileHeight"];
	tile_data_json = _tileset[? "tileDataJson"];
}