draw_set_colour($C870E0);
draw_rectangle(0, 0, room_width, demo_id.tilemap_offset_y, false);

draw_set_colour(c_white);
draw_set_font(fnt_default);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(0, 0, "Seed: " + string(demo_id.seed));
draw_text(0, 24, "Time Taken: " + demo_id.time_taken);

var _percent = demo_id.progress / demo_id.max_progress;

draw_set_colour($FF4070);
draw_rectangle(208, demo_id.tilemap_offset_y / 2 - 8, 208 + 200*_percent, demo_id.tilemap_offset_y / 2 + 8, false);
draw_set_colour(c_black);
draw_rectangle(208, demo_id.tilemap_offset_y / 2 - 8, 408, demo_id.tilemap_offset_y / 2 + 8, true);

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_colour(c_white);
draw_text(308, demo_id.tilemap_offset_y / 2, string_format(_percent * 100, 3, 2) + "%");