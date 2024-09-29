extends Area2D

@export var current_number: int = 99
@onready var number_label: Label = $CenterContainer/NumberLabel

const MAXIMUM_PLAYER_NUMBER = 10e9
const MINIMUM_PLAYER_NUMBER = MAXIMUM_PLAYER_NUMBER*-1

func _ready() -> void:
	Utils.move_player_to.connect(Callable(self,"move_player_to"))
	Utils.handle_player_operation.connect(Callable(self,"handle_player_operation"))

func _process(_delta: float) -> void:
	set_valid_player_number()
	update_player_label()

func set_valid_player_number() -> void:
	if current_number > MAXIMUM_PLAYER_NUMBER:
		current_number = MAXIMUM_PLAYER_NUMBER
	elif current_number < MINIMUM_PLAYER_NUMBER:
		current_number = MINIMUM_PLAYER_NUMBER

func update_player_label() -> void:
	number_label.text = str(current_number)

func player_add(value: int) -> void:
	current_number += value

func player_subtract(value: int) -> void:
	current_number -= value

func player_multiplication(value: int) -> void:
	current_number *= value

func player_division(value: int) -> void:
	current_number /= value

func player_square() -> void:
	current_number *= current_number

func player_combine(value: int) -> void:
	current_number = int(str(current_number) + str(value))
	
func move_player_to(position: Vector2) -> void:
	create_new_hexagon_on_player_pos()
	self.position = position

func create_new_hexagon_on_player_pos() -> void:
	var new_hexagon = preload("res://elements/hexagon.tscn")
	var new_hexagon_instance = new_hexagon.instantiate()
	new_hexagon_instance.position = self.position
	get_parent().add_child(new_hexagon_instance)
	
func handle_player_operation(value: int) -> void:
	match Utils.selected_operation_type:
		Utils.OPERATION_TYPE.addition: player_add(value)
		Utils.OPERATION_TYPE.subtraction: player_subtract(value)
		Utils.OPERATION_TYPE.multiplication: player_multiplication(value)
		Utils.OPERATION_TYPE.division: player_division(value)
		Utils.OPERATION_TYPE.square: player_square()
		Utils.OPERATION_TYPE.combine: player_combine(value)
		_: print('Invalid Operator')
