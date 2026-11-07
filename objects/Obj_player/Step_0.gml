if (GAME_FROZEN) {
	image_speed = 0;
	exit;
}
image_speed = 1;

var _left = keyboard_check(vk_left);
var _right = keyboard_check(vk_right);
var _jump_down = keyboard_check_pressed(ord("X"))
var _jump_held = keyboard_check(ord("X"))
var _run = keyboard_check(vk_shift);

if (jump_buffer > 0) jump_buffer--;

var _on_ground = place_meeting(x, y + 1, global.tilemap);


// Горизонтальное движение
var _dir = _right - _left;
var _target = _dir * move_speed * (_run ? run_mult : 1);
var _acc = (_dir == 0) ? (_on_ground ? 0.8 : 0.15) : (_on_ground ? accel_ground : accel_air);
hspd = approach (hspd, _target, _acc);
if (_dir != 0) facing = _dir;


// Вертикальное движение
if (_on_ground) {
	if (vspd > 0) vspd = 0;
	coyote = coyote_max;
} else {
	vspd = min(vspd + gravity_force, max_fall);
	if (coyote > 0) coyote--;
}

if (_jump_down) jump_buffer = 6;
if (jump_buffer > 0 && coyote > 0) {
	vspd = -jump_height;
	jump_buffer = 0;
	coyote = 0;
	jump_cut = false;
}

if (!_jump_held && vspd < -2 && !jump_cut) {
	vspd *= 0.5;
	jump_cut = true;
}


// Движение и столкновение
move_and_collide(hspd, vspd, global.tilemap, 4, 0, 0, 10, 15);

if (x < 12) { x = 12; hspd = max(hspd, 0); }
if (x > room_width - 12) { x = room_width - 12; hspd = min(hspd, 0); }

if (vspd < 0 && place_meeting(x, y - 1, global.tilemap)) vspd = 0;
if (hspd != 0 && place_meeting(x + sign(hspd), y, global.tilemap)) hspd = 0;

if (place_meeting(x, y, global.tilemap)) {
	var _n = 0;
	while (place_meeting(x, y, global.tilemap) && _n < 16) {
	y -= 1;
	_n++;
	}
}