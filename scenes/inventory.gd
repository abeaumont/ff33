extends Node2D

signal on_item_button_clicked(resource_name: String)

func _ready():
	add("genericItem_color_005")

func add(resource_name):
	$GridContainer.add_object(resource_name)
	
func remove(resource_name):
	$GridContainer.remove_object(resource_name)

func _on_item_button_clicked(resource_name: Variant) -> void:
	emit_signal("on_item_button_clicked", resource_name)

func _on_close_pressed() -> void:
	hide()
