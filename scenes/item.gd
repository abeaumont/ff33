extends Area2D

var defaultCursor = load("res://assets/cursors/Outline/Double/cursor_none.png")
var itemCursor = load("res://assets/cursors/Outline/Double/target_b.png")
var description

signal open_actions_menu(item)

	
func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			emit_signal("open_actions_menu", self)

func _on_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(itemCursor)

func _on_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(defaultCursor)
