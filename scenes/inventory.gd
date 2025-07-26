extends Node2D

signal on_item_button_clicked(resource_name: String)

func _ready():
	add("genericItem_color_005")
	
	
func _process(_delta):
	pass

func add(resource_name):
	print("addition requested!")
	$GridContainer.add_object(resource_name)
	
func delete(resource_name):
	$GridContainer.remove_object(resource_name)

func _on_item_button_clicked(resource_name: Variant) -> void:
	emit_signal("on_item_button_clicked", resource_name)
