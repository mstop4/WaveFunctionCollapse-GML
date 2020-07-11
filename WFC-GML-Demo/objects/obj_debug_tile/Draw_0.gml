if (draw_side_data) {
	for (var i=0; i<4; i++) {
		var _offsets = side_data_offsets[i];
		
		if (obj_debug_tile_controller.draw_mode == 0)
			draw_text(x + _offsets[0], y + _offsets[1], side_groups[i]);
		else
			draw_text(x + _offsets[0], y + _offsets[1], neighbours[i]);
	}
	
	draw_text(x+16, y+16, string(transforms));
}