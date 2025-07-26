extends Node2D

var text = "Pero Begitxo! Sin tus gafas no puedes ir a la Euskal. Encuéntralas antes de volver de tus vacaciones, te esperamos en el BEC!"
var size = 0


func _unhandled_key_input(event: InputEvent) -> void:
	if event.pressed and event.keycode == KEY_ESCAPE:
		get_tree().quit()


func _on_timer_timeout() -> void:
	size += 1
	$ColorRect/Label.text = text.substr(0, size)
	if size >= text.length():
		$Timer.stop()
		$AnimatedSprite2D.stop()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level1.tscn")
