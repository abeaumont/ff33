extends ColorRect

func _ready() -> void:
	hide()

func show_box(message: Variant) -> void:
	$Msg.text = message
	show()
	
