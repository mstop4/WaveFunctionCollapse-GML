//draw_set_halign(fa_center);
//draw_set_valign(fa_center);

if (is_exemplar) {
	draw_set_colour($FF00C0);
	draw_rectangle(x-border_size, y-border_size, x+31+border_size, y+31+border_size, false);
}

draw_tile(editor_id.tileset_index, tile_data, 0, x, y);

draw_set_halign(fa_center);
draw_set_colour(c_white);
draw_text(x + 16, y - 16, side_groups[| SIDE.TOP]);
draw_text(x + 16, y + 48, side_groups[| SIDE.BOTTOM]);
draw_set_halign(fa_right);
draw_text(x - 16, y + 16, side_groups[| SIDE.LEFT]);
draw_set_halign(fa_left);
draw_text(x + 48, y + 16, side_groups[| SIDE.RIGHT]);