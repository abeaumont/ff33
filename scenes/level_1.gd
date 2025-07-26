extends Node2D

var defaultCursor = load("res://assets/cursors/Outline/Double/cursor_none.png");
var current_item

func _ready():
	Input.set_custom_mouse_cursor(defaultCursor)

func _on_open_actions_menu(item) -> void:
	if item == $Shovel or item == $Dust or item == $Cofre:
		$ActionsMenu/Control/ColorRect/MarginContainer/VBoxContainer/Guardar.hide()
		$ActionsMenu/Control/ColorRect/MarginContainer/VBoxContainer/Usar.show()
	else:	
		$ActionsMenu/Control/ColorRect/MarginContainer/VBoxContainer/Guardar.show()
		$ActionsMenu/Control/ColorRect/MarginContainer/VBoxContainer/Usar.hide()
	$ActionsMenu.show_menu(item)

func _on_actions_menu_open_message_box(message: Variant) -> void:
	$MsgBox.show_box(message)

func _on_save_item_clicked(resource_name: String) -> void:
	for child in get_children():
		if child is Itemm and child.get_resource_name() == resource_name:
			child.hide()
			break

func _on_use_item_clicked(item: Variant) -> void:
	current_item = item
	$inventory.show()
	
func _on_item_picked(item) -> void:
	pass

func _unhandled_key_input(event: InputEvent) -> void:
	if event.pressed and event.keycode == KEY_I:
		$inventory.visible = !$inventory.visible
	if event.pressed and event.keycode == KEY_ESCAPE:
		get_tree().quit()

func _on_inventory_on_item_button_clicked(resource_name: String) -> void:
	var item
	for child in get_children():
		if child is Itemm and child.get_resource_name() == resource_name:
			item = child
			break
	if not current_item: return
	if current_item == $Shovel and item == $Bone:
		$inventory.remove(resource_name)
		$inventory.add($Shovel.get_resource_name())
		$Shovel.hide()
		current_item = null
	else:
		$MsgBox.show_box("Eso no tiene el más mínimo sentido, insensato!")
