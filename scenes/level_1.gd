extends Node2D

var defaultCursor = load("res://assets/cursors/Outline/Double/cursor_none.png");
var itemCursor = load("res://assets/cursors/Outline/Double/cursor_help.png")
const CLICK_RADIUS = 100

func _ready():
	Input.set_custom_mouse_cursor(defaultCursor)

func _process(_delta: float) -> void:
	var pos = get_viewport().get_mouse_position()
	if (pos - $shovel.position).length() < CLICK_RADIUS:
		Input.set_custom_mouse_cursor(itemCursor)
	else:
		Input.set_custom_mouse_cursor(defaultCursor)
		
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			get_tree().quit()
