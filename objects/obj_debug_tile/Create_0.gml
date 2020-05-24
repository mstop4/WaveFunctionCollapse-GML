tilemap_id = 0;
tile_id = 0;
transforms = 0;
side_groups = [];
neighbours = [];

draw_side_data = false;

side_data_offsets[SIDE.TOP] = [16, -16];
side_data_offsets[SIDE.BOTTOM] = [16, 32];
side_data_offsets[SIDE.LEFT] = [-16, 0];
side_data_offsets[SIDE.RIGHT] = [48, 0];