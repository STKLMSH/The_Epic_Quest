if (instance_exists(Obj_player)) {
	var _tx = Obj_player.x - cam_w * 0.5 + Obj_player.facing * 28 + abs(Obj_player.hspd) * 6;
	var _ty = Obj_player.y - 24 - cam_h * 0.5;
	cam_x = lerp(cam_x, _tx, 0.12);
	cam_y = lerp(cam_y, _ty, 0.12);
}

cam_x = clamp(cam_x, 0, room_width - cam_w);
cam_y = clamp(cam_y, 0, room_height - cam_h);

var _sx = 0; 
var _sy = 0;
if (global.shake > 0) {
	_sx = irandom_range(-1, 1) * ceil(global.shake);
	_sy = irandom_range(-1, 1) * ceil(global.shake);
}

camera_set_view_pos(view_camera[0], floor(cam_x) + _sx, floor(cam_y) + _sy);