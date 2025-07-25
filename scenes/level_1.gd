extends Node2D

const CLICK_RADIUS = 100
var defaultCursor = load("res://assets/cursors/Outline/Double/cursor_none.png");

var objects = []

func _ready():
	Input.set_custom_mouse_cursor(defaultCursor)
	
func _init() -> void:
	Input.set_custom_mouse_cursor(defaultCursor)
	#print($Shovel.is_pickable())
	#print($Shovel.is_visible())
#	objects = [$shovel]
#	

func _on_open_actions_menu(item) -> void:
	$ActionsMenu.show_menu(item)
	print(item)
