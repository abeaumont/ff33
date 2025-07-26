extends Node2D

func _ready():
	add("genericItem_color_005")
	
	
func _process(_delta):
	pass

func add(resource_name):
	print("addition requested!")
	$GridContainer.add_object(resource_name)
	
func delete(resource_name):
	$GridContainer.remove_object(resource_name)
