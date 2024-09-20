extends Area2D

@onready var label: Label = $CenterContainer/NumberLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Utils.player_add.connect(Callable(self,"add_number_to_player"))
	label.text = str(Utils.player_current_number)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_player_label()
	
func update_player_label() -> void:
	label.text = str(Utils.player_current_number)
	
func add_number_to_player(number: int) -> void:
	Utils.player_current_number += number
	set_new_pos()

func set_new_pos() -> void:
	var current_pos = self.global_position
	Utils.player_move_to_current_mouse_pos.emit(current_pos)
