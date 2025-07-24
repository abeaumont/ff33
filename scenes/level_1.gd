extends Node2D

var defaultCursor = load("res://assets/cursors/Outline/Double/cursor_none.png");
var itemCursor = load("res://assets/cursors/Outline/Double/cursor_help.png")
const CLICK_RADIUS = 100

var objects = []

func _ready():
	objects = [$shovel]
	Input.set_custom_mouse_cursor(defaultCursor)

func _process(_delta: float) -> void:
	var pos = get_viewport().get_mouse_position()
	var found = false
	for object in objects:
		if (pos - object.position).length() < CLICK_RADIUS:
			Input.set_custom_mouse_cursor(itemCursor)
			found = true
			break
	if not found:
		Input.set_custom_mouse_cursor(defaultCursor)
		
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			get_tree().quit()
		elif event.keycode == KEY_I:
			$inventory.visible = !$inventory.visible
	elif event is InputEventMouseButton:
		var pos = get_viewport().get_mouse_position()
		for i in range(objects.size()):
			if (pos - objects[i].position).length() < CLICK_RADIUS:
				objects[i].hide()
				objects.remove_at(i)
				break
