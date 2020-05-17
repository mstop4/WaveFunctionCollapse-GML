var _save_dir = get_save_filename("*.json", "test");

var _file = file_text_open_write(_save_dir);
file_text_write_string(_file, json_encode(tile_data));
file_text_close(_file);