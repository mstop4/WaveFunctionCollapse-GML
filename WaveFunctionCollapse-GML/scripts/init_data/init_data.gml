// 0 - none
// 1 - rotate
// 2 - flip (v)
// 3 - flip, rotate
// 4 - mirror (h)
// 5 - mirror, rotate
// 6 - mirror, flip
// 7 - mirror, flip, rotate

symmetry_data[SYMMETRY.X] = [0, 0, 0, 0, 0, 0, 0, 0];
symmetry_data[SYMMETRY.T] = [0, 1, 2, 3, 0, 1, 2, 3];
symmetry_data[SYMMETRY.I] = [0, 1, 0, 1, 0, 1, 0, 1];
symmetry_data[SYMMETRY.L] = [0, 1, 1, 2, 3, 0, 2, 3];
symmetry_data[SYMMETRY.Z] = [0, 1, 1, 0, 1, 0, 0, 1];
symmetry_data[SYMMETRY.R] = [0, 1, 2, 3, 4, 5, 6, 7];
symmetry_data[SYMMETRY.M] = [0, 0, 0, 0, 1, 1, 1, 1];
symmetry_data[SYMMETRY.E] = [0, 0, 1, 1, 0, 0, 1, 1];

base_weight[SYMMETRY.X] = 1;
base_weight[SYMMETRY.T] = 1/4;
base_weight[SYMMETRY.I] = 1/2;
base_weight[SYMMETRY.L] = 1/4;
base_weight[SYMMETRY.Z] = 1/2;
base_weight[SYMMETRY.R] = 1/8;
base_weight[SYMMETRY.M] = 1/2;
base_weight[SYMMETRY.E] = 1/2;

exemplar_tiles[SYMMETRY.X] = [0, -1, -1, -1, -1, -1, -1, -1];
exemplar_tiles[SYMMETRY.T] = [0,  1, -1, -1, -1, -1,  2,  3];
exemplar_tiles[SYMMETRY.I] = [0, -1, -1, -1, -1, -1, -1,  1];
exemplar_tiles[SYMMETRY.L] = [0,  1, -1, -1, -1, -1,  2,  3];
exemplar_tiles[SYMMETRY.Z] = [0, -1, -1, -1, -1, -1, -1,  1];
exemplar_tiles[SYMMETRY.R] = [0,  1,  2,  3,  4,  5,  6,  7];
exemplar_tiles[SYMMETRY.M] = [0, -1, -1, -1, -1, -1, -1,  1];
exemplar_tiles[SYMMETRY.E] = [0, -1, -1, -1, -1, -1, -1,  1];

symmetry_map = ds_map_create();
symmetry_map[? "X"] = SYMMETRY.X;
symmetry_map[? "T"] = SYMMETRY.T;
symmetry_map[? "I"] = SYMMETRY.I;
symmetry_map[? "L"] = SYMMETRY.L;
symmetry_map[? "Z"] = SYMMETRY.Z;
symmetry_map[? "R"] = SYMMETRY.R;
symmetry_map[? "M"] = SYMMETRY.M;
symmetry_map[? "E"] = SYMMETRY.E;

neighbour_offsets[SIDE.TOP] = [0, -1];
neighbour_offsets[SIDE.LEFT] = [-1, 0];
neighbour_offsets[SIDE.BOTTOM] = [0, 1];
neighbour_offsets[SIDE.RIGHT] = [1, 0];

opposite_neighbour[SIDE.TOP] = SIDE.BOTTOM;
opposite_neighbour[SIDE.BOTTOM] = SIDE.TOP;
opposite_neighbour[SIDE.LEFT] = SIDE.RIGHT;
opposite_neighbour[SIDE.RIGHT] = SIDE.LEFT;
