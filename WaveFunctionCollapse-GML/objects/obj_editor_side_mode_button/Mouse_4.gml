with (editor_id) {
	side_mode = side_mode == EDITOR_SIDE_MODE.MAX-1 ? EDITOR_SIDE_MODE.EDGE_IDS : side_mode + 1;
	
	if (side_mode == EDITOR_SIDE_MODE.EDGE_IDS) {
		side_array = cur_edited_tile != noone ? cur_edited_tile.side_groups : -1;
	} else if (side_mode == EDITOR_SIDE_MODE.NEIGHBOURS) {
		side_array = cur_edited_tile != noone ? cur_edited_tile.neighbours : -1;
	}
}