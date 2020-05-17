// @arg neighbours
// Rotate tile neighbours 90 degrees clockwise

var _neighbours = argument[0];
var _new_neighbours = ds_list_create();

_new_neighbours[| SIDE.TOP] = _neighbours[| SIDE.LEFT];
_new_neighbours[| SIDE.LEFT] = _neighbours[| SIDE.BOTTOM];
_new_neighbours[| SIDE.BOTTOM] = _neighbours[| SIDE.RIGHT];
_new_neighbours[| SIDE.RIGHT] = _neighbours[| SIDE.TOP];

return _new_neighbours;