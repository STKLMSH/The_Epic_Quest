game_new_run();
global.tilemap = layer_tilemap_get_id("Tiles_Ground");
display_set_gui_size(GUI_W, GUI_H);

state = GAME_STATE.PLAY;


// камера
cam_w = camera_get_view_width(view_camera[0]);
cam_h = camera_get_view_height(view_camera[0]);

cam_x = 0;
cam_y = 0;

if (instance_exists(Obj_player)) {
	cam_x = clamp(Obj_player.x - cam_w * 0.5, 0, room_width - cam_w);
	cam_y = clamp(Obj_player.y - cam_h * 0.5, 0, room_width - cam_h);
}

camera_set_view_pos(view_camera[0], floor(cam_x), floor(cam_y));

coin_pop = 0;