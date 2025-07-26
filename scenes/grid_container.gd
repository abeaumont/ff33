extends GridContainer

var empty_button_scene = preload("res://scenes/EmptyButton.tscn")
var item_button_scene = preload("res://scenes/ItemButton.tscn")

const N = 9

func _ready():
	for i in range(N):
		var button = empty_button_scene.instantiate()
		add_child(button)
	pass

func add_object(resource_name: String):
	var resource_path = "res://assets/objects/Colored/%s.png" % resource_name

	# Try to load the texture
	var icon = load(resource_path)
	if not icon:
		push_error("Could not load: %s" % resource_path)
		return

	# Find and replace first EmptyButton
	var index = 0
	for child in get_children():
		if child is EmptyButton:
			child.queue_free()

			var item = item_button_scene.instantiate()
			item.icon = icon
			item.disabled = true

			add_child(item)
			move_child(item, index)
			return
		index += 1

	push_warning("No empty button available to insert object.")

func remove_object(resource_name: String):
	var resource_path = "res://assets/objects/Colored/%s.png" % resource_name
	var icon_to_remove = load(resource_path)
	if not icon_to_remove:
		push_error("Could not load: %s" % resource_path)
		return

	var index = 0
	for child in get_children():
		if child is ItemButton and child.icon == icon_to_remove:
			child.queue_free()

			var empty = empty_button_scene.instantiate()

			add_child(empty)
			move_child(empty, index)
			return  # remove only one
		index += 1

	push_warning("No item with icon %s found in grid." % resource_name)
