init_data();
raw_tile_data = -1;
tile_data = -1;
load_tile_data();

// Constants
side_data_offsets[SIDE.TOP] = [16, -16];
side_data_offsets[SIDE.BOTTOM] = [16, 32];
side_data_offsets[SIDE.LEFT] = [-16, 0];
side_data_offsets[SIDE.RIGHT] = [48, 0];

// Modes
tile_mode = 1;
side_mode = 1;

// Working Vars
cur_edited_tile = noone;
raw_tile_buttons = ds_list_create();
final_tile_buttons = ds_list_create();
side_array = -1;
side_label[0] = "None";
side_label[1] = "Edge IDs";
side_label[2] = "Neighbours";

var _side_mode_button = instance_create_layer(800, 32, "Control", obj_editor_side_mode_button);
_side_mode_button.editor_id = id;

create_raw_tile_ui();
create_final_tile_ui();

draw_set_font(fnt_default);