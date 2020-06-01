ds_map_destroy(raw_tile_data);
ds_map_destroy(tile_data);
ds_list_destroy(exclusion_list);

layer_destroy(debug_layer);

destroy_data();