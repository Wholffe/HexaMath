extends Node2D

@export var current_player_number = 99
@onready var layer0 = $Layer0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Utils.player_current_number = current_player_number
	Utils.player_move.connect(Callable(self,"set_new_player_pos"))
	var cells = layer0.get_used_cells()
	for i in cells:
		print(i)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func set_new_player_pos(old_player_pos: Vector2) -> void:
	var new_player_pos = layer0.local_to_map(get_global_mouse_position())
	old_player_pos = layer0.local_to_map(old_player_pos)
	layer0.set_cell(new_player_pos,0,Vector2i.ZERO,2)
	layer0.set_cell(old_player_pos,0,Vector2i.ZERO,1)
