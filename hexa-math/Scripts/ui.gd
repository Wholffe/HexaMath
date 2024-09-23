extends CanvasLayer

func _on_plus_button_pressed() -> void:
	Utils.selected_operation_type = Utils.OPERATION_TYPE.addition

func _on_minus_button_pressed() -> void:
	Utils.selected_operation_type = Utils.OPERATION_TYPE.subtraction

func _on_multiply_button_pressed() -> void:
	Utils.selected_operation_type = Utils.OPERATION_TYPE.multiplication

func _on_divide_button_pressed() -> void:
	Utils.selected_operation_type = Utils.OPERATION_TYPE.division

func _on_square_button_pressed() -> void:
	Utils.selected_operation_type = Utils.OPERATION_TYPE.square

func _on_combine_button_pressed() -> void:
	Utils.selected_operation_type = Utils.OPERATION_TYPE.combine
