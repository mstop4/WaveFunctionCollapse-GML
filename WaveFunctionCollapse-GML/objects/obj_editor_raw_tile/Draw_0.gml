draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_colour(c_white);
draw_tile(editor_id.tileset_index, tile_data, 0, x, y);
draw_text(x+16, y+48, string(tile_index));