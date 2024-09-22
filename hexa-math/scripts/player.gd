extends Area2D

@export var current_number: int = 99
@onready var number_label: Label = $CenterContainer/NumberLabel

func _ready() -> void:
	Utils.move_player_to.connect(Callable(self,"move_player_to"))
	Utils.player_add.connect(Callable(self,"player_add"))

func _process(_delta: float) -> void:
	update_player_label()

func update_player_label():
	number_label.text = str(current_number)

func player_add(value: int):
	current_number += value
	
func move_player_to(position: Vector2):
	create_new_hexagon(self.position)
	self.position = position

func create_new_hexagon(position: Vector2i):
	var new_hexagon = preload("res://grid_elements/hexagon.tscn")
	var new_hexagon_instance = new_hexagon.instantiate()
	new_hexagon_instance.position = self.position
	get_parent().add_child(new_hexagon_instance)
