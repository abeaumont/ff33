extends Node2D

var text = "¡Enhorabuena Begitxo! Ahora que has encontrado tus gafas de sol puedes venirte a la Euskal a ayudarnos con la organización que estamos a tope de trabajo!"
var size = 0


func _unhandled_key_input(event: InputEvent) -> void:
	if event.pressed and event.keycode == KEY_ESCAPE:
		get_tree().quit()


func _on_timer_timeout() -> void:
	size += 1
	$Label.text = text.substr(0, size)
	if size >= text.length():
		$Timer.stop()
		$AnimatedSprite2D.stop()


func _on_button_pressed() -> void:
	get_tree().quit()
