draw_set_colour($C870E0);
draw_rectangle(0, 0, room_width, demo_id.tilemap_offset_y, false);

draw_set_colour(c_white);
draw_set_font(fnt_default);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(0, 0, "Seed: " + string(demo_id.seed));