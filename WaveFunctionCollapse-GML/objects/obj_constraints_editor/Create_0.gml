init_data();
raw_tile_data = -1;
tile_data = -1;
load_tile_data();

// Constants
side_data_offsets[SIDE.TOP] = [16, -16];
side_data_offsets[SIDE.BOTTOM] = [16, 32];
side_data_offsets[SIDE.LEFT] = [-16, 0];
side_data_offsets[SIDE.RIGHT] = [48, 0];
side_label[EDITOR_SIDE_MODE.NONE] = "None";
side_label[EDITOR_SIDE_MODE.EDGE_IDS] = "Edge IDs";
side_label[EDITOR_SIDE_MODE.NEIGHBOURS] = "Neighbours";
raw_ui_layer = layer_get_id("Raw_Layer");
final_ui_layer = layer_get_id("Final_Layer");

// Modes
tile_mode = EDITOR_TILE_MODE.RAW;
side_mode = EDITOR_SIDE_MODE.EDGE_IDS;

// Working Vars
cur_edited_tile = noone;
raw_tile_buttons = ds_list_create();
final_tile_buttons = ds_list_create();
side_array = -1;

var _side_mode_button = instance_create_layer(800, 32, "Control", obj_editor_side_mode_button);
_side_mode_button.editor_id = id;

var _tile_mode_button = instance_create_layer(800, 72, "Control", obj_editor_tile_mode_button);
_tile_mode_button.editor_id = id;

create_raw_tile_ui();
create_final_tile_ui();

layer_set_visible(raw_ui_layer, true);
layer_set_visible(final_ui_layer, false);

draw_set_font(fnt_default);