extends Area2D
class_name Itemm

var defaultCursor = load("res://assets/cursors/Outline/Double/cursor_none.png")
var itemCursor = load("res://assets/cursors/Outline/Double/target_b.png")
@export var description : String

signal open_actions_menu(item)

	
func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			emit_signal("open_actions_menu", self)

func _on_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(itemCursor)

func _on_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(defaultCursor)
	
func get_resource_name():
	var sprite: Sprite2D = $Sprite2D
	var texture: Texture2D = sprite.texture

	if texture and texture.resource_path != "":
		return texture.resource_path.get_file().get_basename()
