game_new_run();
global.tilemap = layer_tilemap_get_id("Tiles_Ground");
display_set_gui_size(GUI_W, GUI_H);

state = GAME_STATE.PLAY;
