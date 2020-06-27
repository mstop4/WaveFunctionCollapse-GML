if (active) {
	cur_subtile++;
	if (cur_subtile >= num_subtiles) {
		cur_tile++;
		
		if (cur_tile >= num_tiles) {
			cur_tile = 0;
		}
		
		var _all_tiles = wfc_id.tile_data[? "tiles"];
		var _tile = _all_tiles[| cur_tile];
		num_subtiles = ds_list_size(_tile[? "tileId"]);
		cur_subtile = 0;
	}
	
	event_user(0);
}