draw_sprite(tileset_preview, 0, x, y);
draw_set_font(fnt_default);
draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_set_colour(c_white);
draw_text(x+40, y+16, tileset_name);