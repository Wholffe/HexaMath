extends Node

var rng: RandomNumberGenerator = RandomNumberGenerator.new()

signal player_add(value: int)
signal move_player_to(global_position: Vector2i)
