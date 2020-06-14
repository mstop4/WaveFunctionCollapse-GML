with (editor_id) {
	cur_edited_tile = other.id;

	if (side_mode == EDITOR_SIDE_MODE.EDGE_IDS) {
		side_array = cur_edited_tile != noone ? cur_edited_tile.side_groups : -1;
	} else if (side_mode == EDITOR_SIDE_MODE.NEIGHBOURS) {
		side_array = cur_edited_tile != noone ? cur_edited_tile.neighbours : -1;
	}
}