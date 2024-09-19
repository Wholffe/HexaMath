extends Area2D
class_name HexagonNode2D

var rng: RandomNumberGenerator = RandomNumberGenerator.new()

@export var is_random_number: bool = true
@export var number: int = 10

const min_number: int = 1
const max_number: int = 20

@onready var sprite: Sprite2D = $Sprite2D
@onready var label: Label = $CenterContainer/NumberLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if is_random_number:
		label.text = str(rng.randi_range(min_number,max_number))
	else:
		label.text = str(number)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		Utils.player_add.emit(int(label.text))
		print(self.label.text)

func _on_mouse_entered() -> void:
	sprite.frame = 4

func _on_mouse_exited() -> void:
	sprite.frame = 3
