with (editor_id) {
	cur_edited_tile = other.id;

	if (side_mode == EDITOR_SIDE_MODE.EDGE_IDS) {
		side_array = cur_edited_tile != noone ? cur_edited_tile.side_groups : -1;
	} else if (side_mode == EDITOR_SIDE_MODE.NEIGHBOURS) {
		side_array = cur_edited_tile != noone ? cur_edited_tile.neighbours : -1;
	}
}

var _exemplar_data = editor_id.exemplar_tiles[symmetry];
	
for (var i=0; i<8; i++) {
	var _cur_exemplar_inst = editor_id.exemplar_tile_previews[| i];
	var _new_tile_data = tile_data;
	ds_list_copy(_cur_exemplar_inst.side_groups, side_groups);
	ds_list_copy(_cur_exemplar_inst.neighbours, neighbours);
	
	if (i & 4) {
		_new_tile_data = tile_set_mirror(_new_tile_data, true);
		tile_neighbours_mirror(_cur_exemplar_inst.side_groups);
		tile_neighbours_mirror(_cur_exemplar_inst.neighbours);
	}
	
	if (i & 2) {
		_new_tile_data = tile_set_flip(_new_tile_data, true);
		tile_neighbours_flip(_cur_exemplar_inst.side_groups);
		tile_neighbours_flip(_cur_exemplar_inst.neighbours);
	}
	
	if (i & 1) {
		_new_tile_data = tile_set_rotate(_new_tile_data, true);
		tile_neighbours_rotate(_cur_exemplar_inst.side_groups);
		tile_neighbours_rotate(_cur_exemplar_inst.neighbours);
	}
	
	_cur_exemplar_inst.tile_data = _new_tile_data;
	_cur_exemplar_inst.is_exemplar = _exemplar_data[i] != -1;
	_cur_exemplar_inst.visible = true;
}

instance_activate_object(obj_editor_edit_side_button);