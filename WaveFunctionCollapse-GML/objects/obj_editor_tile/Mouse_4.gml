with (editor_id) {
	cur_edited_tile = other.id;

	if (side_mode == 0) {
		side_array = cur_edited_tile != noone ? cur_edited_tile.side_groups : -1;
		side_label = "Edge IDs";
	} else if (side_mode == 1) {
		side_array = cur_edited_tile != noone ? cur_edited_tile.neighbours : -1;
		side_label = "Neighbours";
	}
}