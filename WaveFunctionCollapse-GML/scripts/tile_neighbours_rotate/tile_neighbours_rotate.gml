/// @arg sides
// Rotate tile neighbours 90 degrees clockwise

var _sides = argument[0];
var _new_sides = [
	_sides[| SIDE.LEFT],
	_sides[| SIDE.BOTTOM],
	_sides[| SIDE.RIGHT],
	_sides[| SIDE.TOP]
];

for (var i=0; i<SIDE.MAX; i++) {
	_sides[| i] = _new_sides[i];
	ds_list_mark_as_map(_sides, i);
}