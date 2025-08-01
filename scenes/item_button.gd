extends Button
class_name ItemButton

signal on_item_button_clicked(resource_name: String)

func _ready():
	self.pressed.connect(_on_pressed)

func is_empty():
	return false

func get_resource_name():
	var texture: Texture2D = self.icon

	if texture and texture.resource_path != "":
		return texture.resource_path.get_file().get_basename()
		
func _on_pressed():
	emit_signal("on_item_button_clicked", get_resource_name())
