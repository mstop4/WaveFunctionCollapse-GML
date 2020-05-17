// @arg neighbours
// Flip tile neighbours vertically

var _neighbours = argument[0];
var _new_neighbours = ds_list_create();

_new_neighbours[| SIDE.TOP] = _neighbours[| SIDE.BOTTOM];
_new_neighbours[| SIDE.LEFT] = _neighbours[| SIDE.LEFT];
_new_neighbours[| SIDE.BOTTOM] = _neighbours[| SIDE.TOP];
_new_neighbours[| SIDE.RIGHT] = _neighbours[| SIDE.RIGHT];

return _new_neighbours;