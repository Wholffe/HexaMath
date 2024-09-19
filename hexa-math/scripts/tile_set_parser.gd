extends Node2D

@onready var layer0 = $Layer0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var cells = layer0.get_used_cells()
	for i in cells:
		print(i)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#var tile = layer0.local_to_map(get_global_mouse_position())
	#print(tile)
