if (active) {
	var _list = wfc_id.wave_grid[# xx / 32, yy / 32];
	ds_list_clear(_list);
	ds_list_add(_list, cur_tile);
}