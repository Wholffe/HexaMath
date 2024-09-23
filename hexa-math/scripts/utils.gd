extends Node

var rng: RandomNumberGenerator = RandomNumberGenerator.new()
enum OPERATION_TYPE {
	addition, subtraction, multiplication, division, square, combine
}
var selected_operation_type: OPERATION_TYPE = OPERATION_TYPE.addition

signal handle_player_operation(value: int)
signal move_player_to(position: Vector2i)
