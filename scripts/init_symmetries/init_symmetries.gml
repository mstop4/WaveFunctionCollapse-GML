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