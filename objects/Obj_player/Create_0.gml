move_speed = 4;
run_mult = 1.5;
accel_ground = 0.65;
accel_air = 0.35;
jump_height = 8;
gravity_force = 0.4;
max_fall = 12;

hspd = 0;
vspd = 0;

coyote = 0;
coyote_max = 6;
jump_buffer = 0;
jump_cut = 0;

facing = 1;

anim_key = "idle";
sx = 1;
sy = 1;
was_on_ground = false;
fall_speed = 0;

set_anim = function(_spr, _key) {
	if (sprite_index != _spr) {
		sprite_index = _spr;
		image_index = 0;
	}
	anim_key = _spr == Spr_player_atk ? "atk" : _key;
}


