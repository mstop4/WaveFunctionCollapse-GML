/// @arg sides
function tile_neighbours_mirror() {
	// Mirror tile neighbours horizontally

	var _sides = argument[0];
	var _new_sides = [
		_sides[| SIDE.TOP],
		_sides[| SIDE.RIGHT],
		_sides[| SIDE.BOTTOM],
		_sides[| SIDE.LEFT]
	];

	for (var i=0; i<SIDE.MAX; i++) {
		_sides[| i] = _new_sides[i];
		ds_list_mark_as_map(_sides, i);
	}


}
