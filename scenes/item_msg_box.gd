extends ColorRect

func _ready() -> void:
	hide()

func show_box(message: Variant) -> void:
	$Msg.text = message
	show()
	await get_tree().create_timer(3).timeout
	hide()
