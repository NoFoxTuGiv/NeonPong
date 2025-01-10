extends Label

var playerScore
@onready var label: Label = $"."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	playerScore = Global.playerScore
	label.text = str(playerScore)
