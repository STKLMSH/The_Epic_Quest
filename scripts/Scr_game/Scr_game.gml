// Src_game - скрипт с инициализацией и общими функциями

function game_init() {
	if (variable_global_exists("game_inited")) return;
	global.game_inited = true;
	
	if(variable_global_exists("tilemap")) global.tilemap = -1;
	global.coins = 0;
	global.paused = false;
	global.hitstop = 0;
	global.shake = 0;
	global.debug = false;
	global.ui_a = 1;
 // global.inv = inv_create();
 // global.fx = [];
	
 // fonts_init();
 //	rarity_db_init();
 //	item_db_init();	
}

function game_new_run() {
	game_init();
	global.coins = 0;
	global.paused = false;
	global.hitstop = 0;
	global.shake = 0;
 // global.inv = inv_create();
 // global.fx = [];
}

function approach(_a, _b, _step) {
	if(_a < _b) return min(_a + _step, _b);
	return max(_a - _step, _b);
}

function tile_solid_at(_x, _y) {
	return tile_get_index(tilemap_get_at_pixel(global.tilemap, _x, _y)) > 0;
}

function rect_ocerlap(_l1, _t1, _r1, _b1, _l2, _t2, _r2, _b2) {
	return (_l1  <= _r2 && _r1 >= _l2 && _t1 <= _b2 && _b1 >= _t2);
}

function sign_or(_v, _def) {
	if (_v != 0) return sign(_v);
	return sign(_def);
}