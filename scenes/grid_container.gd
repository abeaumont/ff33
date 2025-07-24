extends GridContainer

const N = 9

func _ready():
	for i in range(N):
		var button = Button.new()
		button.icon = load("res://assets/ui/inventory_panel.png")
		button.disabled = true
		add_child(button)
