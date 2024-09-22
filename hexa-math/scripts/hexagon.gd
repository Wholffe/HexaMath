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
		number_label.text = str(get_random_number())
	else:
		number_label.text = str(current_number)

func get_random_number() -> int:
	return rng.randi_range(MIN_NUMBER,MAX_NUMBER)

func move_to_player() -> void:
	self.global_position = Utils.player_position

func _on_mouse_entered() -> void:
	sprite.frame = HOVER_FRAME
	is_clickable = true

func _on_mouse_exited() -> void:
	sprite.frame = BASE_FRAME
	is_clickable = false

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("left_click"):
		Utils.player_add.emit(self.current_number)
		Utils.move_player_to.emit(self.global_position)
		queue_free()
