extends Button
class_name ItemButton

signal on_item_button_clicked(resource_name: String)

func _ready():
	self.pressed.connect(_on_pressed)

func is_empty():
	return false

func get_resource_name():
	var sprite: Sprite2D = find_child("Area2D").find_child("Sprite2D")
	var texture: Texture2D = sprite.texture

	if texture and texture.resource_path != "":
		var result = texture.resource_path.get_file().get_basename()
		print(result)
		return result
		
func _on_pressed():
	emit_signal("on_item_button_clicked", get_resource_name())
