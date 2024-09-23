extends Area2D

@export var random_value: bool = true
@export var current_number: int = 1

const MIN_NUMBER: int = 1
const MAX_NUMBER: int = 20
const BASE_FRAME: int = 3
const HOVER_FRAME: int = 2

var rng: RandomNumberGenerator = Utils.rng
var is_clickable: bool = false

@onready var number_label: Label = $CenterContainer/NumberLabel
@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	set_starting_label()

func set_starting_label() -> void:
	if random_value:
		current_number = get_random_number()
	number_label.text = str(current_number)

func get_random_number() -> int:
	return rng.randi_range(MIN_NUMBER,MAX_NUMBER)

func move_to_player() -> void:
	position = Utils.player_position

func _on_mouse_entered() -> void:
	if is_clickable:
		sprite.frame = HOVER_FRAME

func _on_mouse_exited() -> void:
	if is_clickable:
		sprite.frame = BASE_FRAME

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("left_click") and is_clickable:
		Utils.handle_player_operation.emit(current_number)
		Utils.move_player_to.emit(position)
		queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		is_clickable = true

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		is_clickable = false
