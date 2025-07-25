extends Node2D


const CLICK_RADIUS = 100

var objects = []

func _ready():
	pass
	#print($Shovel.is_pickable())
	#print($Shovel.is_visible())
#	objects = [$shovel]
#	

func _on_open_actions_menu(item: Node) -> void:
	$ActionsMenu.show()
	print(item)
