extends Label

var aiScore
@onready var label: Label = $"."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	aiScore = Global.aiScore
	label.text = str(aiScore)
