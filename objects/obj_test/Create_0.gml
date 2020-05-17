init_enums();

create_test_tiles();
init_symmetries();

// dummy_tile = load_dummy_json();
// var _dummy_json = json_encode(dummy_tile);
// show_debug_message(_dummy_json);

tile_data = load_tile_json("test.json");
show_debug_message(json_encode(tile_data));