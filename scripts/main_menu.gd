extends Control


func _on_Start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_Exit_pressed() -> void:
	get_tree().quit()
