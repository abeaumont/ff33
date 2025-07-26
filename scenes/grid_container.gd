extends GridContainer

var empty_button_scene = preload("res://scenes/EmptyButton.tscn")
var item_button_scene = preload("res://scenes/ItemButton.tscn")

const N = 9

func _ready():
	var shovel = item_button_scene.instantiate()
	shovel.icon = load("res://assets/objects/Colored/genericItem_color_005.png")
	shovel.disabled = true
	add_child(shovel)
	
	for i in range(1,N):
		var button = empty_button_scene.instantiate()
		button.icon = load("res://assets/ui/inventory_panel.png")
		button.disabled = true
		add_child(button)
	pass
