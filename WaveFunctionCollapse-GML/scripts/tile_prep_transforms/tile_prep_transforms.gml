/// @arg sides
function tile_neighbours_flip() {
	// Flip tile neighbours vertically

	var _sides = argument[0]; // TODO: named params don't work?
	var _new_sides = [
		_sides[| SIDE.BOTTOM],
		_sides[| SIDE.LEFT],
		_sides[| SIDE.TOP],
		_sides[| SIDE.RIGHT]
	];

	for (var i=0; i<SIDE.MAX; i++) {
		_sides[| i] = _new_sides[i];
		ds_list_mark_as_map(_sides, i);
	}
}


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


/// @arg sides
function tile_neighbours_rotate() {
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
}
