extends Control

@onready var resumeBtn: Button = $MarginContainer/VBoxContainer/Resume

func resume():
	$AnimationPlayer.play_backwards("blur")
	get_tree().paused = false

func pause():
	$AnimationPlayer.play("blur")
	get_tree().paused = true

func restart():
	$AnimationPlayer.play_backwards("blur")
	Global.aiScore = 0
	Global.playerScore = 0
	get_tree().paused = false
	get_tree().reload_current_scene()

func testEsc():
	if Input.is_action_just_pressed("pause") and !get_tree().paused:
		resumeBtn.grab_focus()
		pause()
	elif Input.is_action_just_pressed("pause") and get_tree().paused:
		resume()

func _on_resume_pressed() -> void:
	resume()

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_restart_pressed() -> void:
	restart()

func _process(_delta: float) -> void:
	testEsc()
