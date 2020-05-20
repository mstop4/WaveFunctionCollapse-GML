/// @arg sides
// Mirror tile neighbours horizontally

var _sides = argument[0];
var _new_sides = [
	_sides[| SIDE.TOP],
	_sides[| SIDE.RIGHT],
	_sides[| SIDE.BOTTOM],
	_sides[| SIDE.LEFT]
];

for (var i=0; i<SIDE.RIGHT+1; i++) {
	_sides[| i] = _new_sides[i];
	ds_list_mark_as_map(_sides, i);
}