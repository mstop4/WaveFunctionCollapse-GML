//draw_set_halign(fa_center);
//draw_set_valign(fa_center);

if (is_exemplar) {
	draw_set_colour($FF00C0);
	draw_rectangle(x-border_size, y-border_size, x+31+border_size, y+31+border_size, false);
}

draw_tile(editor_id.tileset_index, tile_data, 0, x, y);