if (GAME_FROZEN) {
	image_speed = 0;
	exit;
}
image_speed = 1;
age++;
var _player = (instance_exists(Obj_player) && !Obj_player.is_dead) ? Obj_player.id : noone;
if (_player == noone) magnet = false;

if (_player != noone && age > 25) {
	var _px = _player.x;
	var _py = _player.y - 20;
	var _d = point_distance(x, y - 4, _px, _py);
	if (_d < 56) magnet = true;
	if (magnet) {
		mag_speed = min(mag_speed + 0.35, 9);
		var _dir = point_direction(x, y-4, _px, _py);
		x += lengthdir_x(min(mag_speed, _d), _dir);
		y += lengthdir_y(min(mag_speed, _d), _dir);
	}
	if (_d < 14) {
		global.coins += value;
		if (instance_exists(Obj_level_controller)) Obj_level_controller.coin_pop = 1;
		instance_destroy();
		exit;
	}
}

if (!magnet) {
	vspd = min(vspd + 0.3, 8);
	if (hspd != 0) {
		if (tile_solid_at(x + sign(hspd) * 4 + hspd, y - 4)) hspd *= - 0.5;
		else x += hspd;
	}
	var _n = ceil(abs(vspd));
	var _step = (_n > 0) ? vspd / _n : 0;
	repeat (_n) {
		var _ty = (_step > 0) ? y + 1 : y - 9;
		if (tile_solid_at( x, _ty)) {
			if (_step > 0 && vspd > 1.5) vspd = -vspd * 0.45;
			else vspd = 0;
			break;
		}
		y += _step;
	}	
	if (tile_solid_at(x, y + 1)) hspd *= 0.8;
	if (abs(hspd) < 0.05) hspd = 0;
	var _g = 0;
	while (tile_solid_at( x, y - 3) && _g < 24) { y -= 1; _g++ }
}

if (y > room_height + 100) instance_destroy();