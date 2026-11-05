if (GAME_FROZEN) {
	image_speed = 0;
	exit;
}
image_speed = 1;

var _left = keyboard_check(vk_left);
var _right = keyboard_check(vk_right);
var _run = keyboard_check(vk_shift);

var _on_ground = place_meeting(x, y + 1, global.tilemap);

var _dir = _right - _left;
var _target = _dir * move_speed * (_run ? run_mult : 1);
var _acc = (_dir == 0) ? (_on_ground ? 0.8 : 0.15) : (_on_ground ? accel_ground : accel_air);

hspd = approach (hspd, _target, _acc);

if (_dir != 0) facing = _dir;
if (_on_ground) {
	if (vspd > 0) vspd = 0;
} else {
	vspd = min(vspd + gravity_force, max_fall);
}

move_and_collide(hspd, vspd, global.tilemap, 4, 0, 0, 10, 15);

if (x < 12) { x = 12; hspd = max(hspd, 0); }
if (x > room_width - 12) { x = room_width - 12; hspd = min(hspd, 0); }
if (vspd < 0 && place_meeting(x, y - 1, global.tilemap)) vspd = 0;
if (hspd != 0 && place_meeting(x + sign(hspd), y, global.tilemap)) hspd = 0;
if (place_meeting(x, y, global.tilemap_)) {
	var _n = 0;
	while (place_meeting(x, y, global.tilemap_) && _n < 16) {
	y -= 1;
	_n++;
	}
}