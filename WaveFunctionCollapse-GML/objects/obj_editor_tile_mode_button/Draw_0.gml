draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_colour(c_white);
draw_text(x+16, y+16, editor_id.tile_mode == EDITOR_TILE_MODE.RAW ? "Raw" : "Final");