extends Node2D

@export var current_player_number: int = 99
@onready var nonplayerlayer: TileMapLayer = $NonPlayerLayer
@onready var playerlayer: TileMapLayer = $PlayerLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Utils.player_current_number = current_player_number
	Utils.player_move_to_current_mouse_pos.connect(Callable(self,"set_new_player_pos"))
	var cells = nonplayerlayer.get_used_cells()
	var non_player_cell_pos: Array = []
	for vector in cells:
		non_player_cell_pos.append(vector)
	print(non_player_cell_pos)
	
func set_new_player_pos(old_player_pos: Vector2) -> void:
	var new_player_pos = playerlayer.local_to_map(get_global_mouse_position())
	old_player_pos = nonplayerlayer.local_to_map(old_player_pos)
	nonplayerlayer.erase_cell(new_player_pos)
	nonplayerlayer.set_cell(old_player_pos,0,Vector2i.ZERO,1)
	playerlayer.erase_cell(old_player_pos)
	playerlayer.set_cell(new_player_pos,0,Vector2i.ZERO,1)
	Utils.player_current_pos = Vector2(new_player_pos)
