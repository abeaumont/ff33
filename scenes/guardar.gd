extends Button

func _ready():
	# Connect internal signal to emit your custom signal
	self.pressed.connect(_on_pressed)

func _on_pressed():
	emit_signal("on_save_item_clicked")
