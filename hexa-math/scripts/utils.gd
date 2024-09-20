extends Node

var player_current_number: int
var player_current_pos: Vector2

signal player_add(value: int)
signal player_move_to_current_mouse_pos(old_player_pos: Vector2)
