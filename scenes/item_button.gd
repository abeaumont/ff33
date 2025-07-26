extends Button
class_name ItemButton

func _ready():
	pass

func is_empty():
	return false

func get_resource_name():
	var sprite: Sprite2D = find_child("Area2D").find_child("Sprite2D")
	var texture: Texture2D = sprite.texture

	if texture and texture.resource_path != "":
		var result = texture.resource_path.get_file().get_basename()
		print(result)
		return result
