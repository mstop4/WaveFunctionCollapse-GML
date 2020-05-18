init_enums();

create_test_tiles();
init_symmetries();

// dummy_tile = load_dummy_json();
// var _dummy_json = json_encode(dummy_tile);
// show_debug_message(_dummy_json);

raw_tile_data = load_tile_json("test.json");
show_debug_message(json_encode(raw_tile_data));

tile_data = generate_tile_data(raw_tile_data);