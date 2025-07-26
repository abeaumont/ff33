extends MarginContainer

var current_item

signal open_message_box(message)


func show_menu(item):
	current_item = item
	show()
	
func _on_ver_pressed() -> void:
	hide()
	emit_signal("open_message_box", current_item.description)
	

func _on_guardar_pressed() -> void:
	pass # Replace with function body.


func _on_usar_pressed() -> void:
	pass # Replace with function body.
