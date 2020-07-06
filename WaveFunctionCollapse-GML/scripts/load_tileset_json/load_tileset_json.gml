/// @arg filename
var _filename = argument[0];

var _file = file_text_open_read(_filename);
var _raw_json = "";

while (!file_text_eof(_file)) {
	_raw_json += file_text_readln(_file);
}

file_text_close(_file);

return json_decode(_raw_json);