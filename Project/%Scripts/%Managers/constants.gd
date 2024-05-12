extends Node

## TYPES
enum Event {
	TEST
}

enum Target {
	RANDOM,
	WORLD,
	SELF,
	SPIRIT,
	LEADER,
	LEFT_SIDE,
	RIGHT_SIDE,
	BESIDE,
	ALLY_AHEAD,
	ENEMY_AHEAD,
	AHEAD,
	ALLY_BEHIND,
	ALLY_INLINE,
	ENEMY_INLINE,
	INLINE,
	FRONT_ROW,
	BACK_ROW,
	ACROSS,
	ENEMY_ACROSS,
	ENEMY_FRONT_ROW,
	ENEMY_FAR_AHEAD,
	ENEMY_FAR_ACROSS,
	ENEMY_BACK_ROW,
	ALLY,
	ENEMY,
	ANY
}

## FIELDS
var main_menu_scene: String = "res://Project/%Levels/main.tscn"
var play_menu_scene: String = "res://Project/%Levels/play.tscn"
var unlocks_menu_scene: String = "res://Project/%Levels/unlocks.tscn"
var options_menu_scene: String = "res://Project/%Levels/options.tscn"
var shop_scene: String = "res://Project/%Levels/shop.tscn"
var arena_scene: String = "res://Project/%Levels/arena.tscn"


## NOTES: WINWITH + COMBO -> UNLOCK 
