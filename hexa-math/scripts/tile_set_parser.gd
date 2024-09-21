extends Node2D
class_name TileSetParser

@export var current_player_number: int = 99
@onready var non_player_layer: TileMapLayer = $NonPlayerLayer
@onready var player_layer: TileMapLayer = $PlayerLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player_current_pos = player_layer.get_used_cells()[0]
	
	Utils.non_player_pos = non_player_layer.get_used_cells()
	Utils.player_current_number = current_player_number
	Utils.player_move_to_current_mouse_pos.connect(Callable(self,"set_new_player_pos"))
	Utils.player_current_pos = player_current_pos
	
	print(Utils.player_current_pos)
	print(Utils.non_player_pos)

func get_mapped_pos(position: Vector2i) -> Vector2i:
	return non_player_layer.local_to_map(position)
	
func set_new_player_pos(old_player_pos: Vector2i) -> void:
	var new_player_pos = get_mapped_pos(get_global_mouse_position())
	old_player_pos = get_mapped_pos(old_player_pos)
	non_player_layer.erase_cell(new_player_pos)
	non_player_layer.set_cell(old_player_pos,0,Vector2i.ZERO,1)
	player_layer.erase_cell(old_player_pos)
	player_layer.set_cell(new_player_pos,0,Vector2i.ZERO,1)
	Utils.player_current_pos = Vector2i(new_player_pos)
