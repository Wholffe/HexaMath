extends Node

const valid_moving_vectors: Array[Vector2i] = [
	Vector2i(1, 0),
	Vector2i(1, -1),
	Vector2i(0, 1),
	Vector2i(0, -1),
	Vector2i(-1, 0),
	Vector2i(-1, 1)
]

var player_current_number: int
var player_current_pos: Vector2i
var non_player_pos: Array[Vector2i]

signal player_add(value: int)
signal player_move_to_current_mouse_pos(old_player_pos: Vector2i)
