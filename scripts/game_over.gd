extends Control

@onready var play_again: Button = $MarginContainer/VBoxContainer/PlayAgain

func testScore():
	if Global.aiScore == Global.maxScore or Global.playerScore == Global.maxScore:
		game_over()

func _on_goquit_pressed() -> void:
	get_tree().quit()

func _on_play_again_pressed() -> void:
	Global.aiScore = 0
	Global.playerScore = 0
	visible = false
	get_tree().paused = false
	get_tree().reload_current_scene()

func game_over():
	play_again.grab_focus()
	visible = true
	get_tree().paused = true

func _process(_delta: float) -> void:
	testScore()
