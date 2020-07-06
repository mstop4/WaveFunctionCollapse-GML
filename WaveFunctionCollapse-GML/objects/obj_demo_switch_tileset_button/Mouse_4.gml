with (tileset_selector_id) {
	if (other.increment) {
		cur_tileset_index = cur_tileset_index >= num_tilesets-1
			? 0
			: cur_tileset_index + 1;
	} else {
		cur_tileset_index = cur_tileset_index == 0
			? num_tilesets-1
			: cur_tileset_index - 1;
	}

	switch_tileset(demo_id, id, cur_tileset_index);
}