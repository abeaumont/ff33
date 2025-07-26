extends Node2D

enum {START, BONE_PICKED, END}

var defaultCursor = load("res://assets/cursors/Outline/Double/cursor_none.png");
var state = START

func _ready():
	Input.set_custom_mouse_cursor(defaultCursor)

func _on_open_actions_menu(item) -> void:
	$ActionsMenu.show_menu(item)


func _on_actions_menu_open_message_box(message: Variant) -> void:
	$MsgBox.show_box(message)
	await get_tree().create_timer(3).timeout
	$MsgBox.hide()
	
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
	if event.pressed and event.keycode == KEY_ESCAPE:
		get_tree().quit()
	if event.pressed and event.keycode == KEY_W:
		get_tree().change_scene_to_file("res://scenes/win.tscn")
