extends Node

var playerScore
var aiScore
var maxScore = 10


func _ready() -> void:
	playerScore = 0
	aiScore = 0

func _process(_delta: float) -> void:
	if aiScore == maxScore or playerScore == maxScore:
		get_tree().reload_current_scene()
