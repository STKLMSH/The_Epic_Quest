// Src_config - общие настройки, макросы и перечисления

#macro DEV_MODE  true

#macro GUI_W  640
#macro GUI_H  480

#macro LAYER_INST "Instances"

#macro KEY_ATTACK ord("z")
#macro KEY_JUMP ord("x")
#macro KEY_DASH ord("c")
#macro KEY_DROP ord("v")
#macro KEY_RUN vk_shift
#macro KEY_INVENTORY vk_tab
#macro KEY_SWAP_WEAPON vk_control
#macro KEY_PAUSED vk_escape

#macro GAME_FROZEN (global.paused || global.hitstop > 0)

#macro INV_BAG_SIZE 12

enum INV_SLOT {
	HELMET,
	ARMOR,
	BOOTS,
	WEAPON,
	USE_1,
	USE_2,
	USE_3,
	BAG, 
	COUNT = 20,
}

enum ITEM_TYPE { WEAPON, HELMET, ARMOR, BOOTS, USABLE, MISC }

enum RARITY { COMMON, RARE, EPIC, LEGENDARY }

enum GAME_STATE { PLAY, INVENTORY, DEAD, GAMEOVER }

enum SLIME_STATE { IDLE, WINDUP, AIR, HURT, DEAD }

function input_attack_pressed () {
	return keyboard_check_pressed(KEY_ATTACK)
}

function input_jump_pressed () {
	return keyboard_check_pressed(KEY_JUMP)
}

	
