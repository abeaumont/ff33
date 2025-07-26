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

func _on_actions_menu_open_message_box(message: Variant) -> void:
	$MsgBox.show_box(message)
	await get_tree().create_timer(3).timeout
	$MsgBox.hide()


func _on_save_item_clicked(resource_name: String) -> void:
	for child in get_children():
		if child is Itemm and child.get_resource_name() == resource_name:
			remove_child(child)
			break
	
func _on_item_picked(item) -> void:
	match state:
		START:
			if item == $Bone:
				state = BONE_PICKED
			else:
				print("Unknown item picked on state START")
		BONE_PICKED:
			print("Unknown item picked on state BONE_PICKED")
		END:
			print("Unknown item picked on state END")

func _unhandled_key_input(event: InputEvent) -> void:
	if event.pressed and event.keycode == KEY_I:
		$inventory.visible = !$inventory.visible
