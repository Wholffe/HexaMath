extends Area2D
class_name HexagonNode2D

var rng: RandomNumberGenerator = RandomNumberGenerator.new()
const MIN_NUMBER: int = 1
const MAX_NUMBER: int = 20

const FRAME_MOUSE_ENTERED: int = 2
const FRAME_MOUSE_EXITED: int = 3

@onready var sprite: Sprite2D = $Sprite2D
@onready var label: Label = $CenterContainer/NumberLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_label_value()

func update_label_value() -> void:
	label.text = str(rng.randi_range(MIN_NUMBER,MAX_NUMBER))

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		Utils.player_add.emit(int(label.text))

func _on_mouse_entered() -> void:
	sprite.frame = FRAME_MOUSE_ENTERED

func _on_mouse_exited() -> void:
	sprite.frame = FRAME_MOUSE_EXITED
