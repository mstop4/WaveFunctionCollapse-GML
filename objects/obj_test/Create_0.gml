init_enums();

create_test_tiles();
init_symmetries();

dummy_tile = load_dummy_json();
var _file = file_text_open_read("test.json");
var _raw_json = "";

while (!file_text_eof(_file)) {
	_raw_json += file_text_readln(_file);
}

file_text_close(_file);

var _test_json = json_encode(json_decode(_raw_json));
show_debug_message(_test_json);

var _dummy_json = json_encode(dummy_tile);
show_debug_message(_dummy_json);