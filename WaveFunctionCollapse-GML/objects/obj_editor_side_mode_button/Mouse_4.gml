with (editor_id) {
	side_mode = side_mode == 2 ? 1 : side_mode + 1;
	
	if (side_mode == 1) {
		side_array = cur_edited_tile != noone ? cur_edited_tile.side_groups : -1;
	} else if (side_mode == 2) {
		side_array = cur_edited_tile != noone ? cur_edited_tile.neighbours : -1;
	}
}