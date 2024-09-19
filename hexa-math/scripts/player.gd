extends Area2D

@export var current_number: int = 99
@onready var label = $CenterContainer/NumberLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Utils.player_add.connect(Callable(self,"add_number_to_player"))
	label.text = str(current_number)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = str(current_number)
	pass
	
func add_number_to_player(number: int):
	current_number += number
