extends Node2D

@export var speed = 300
@onready var colShape: CollisionShape2D = $CollisionShape2D

var screenSize
var paddle_height

func _ready():
	screenSize = get_viewport_rect().size
	paddle_height = colShape.shape.height + 2 * colShape.shape.radius

func _process(delta):
	if Input.is_action_pressed("move_down"):
		position.y += speed * delta
	if Input.is_action_pressed("move_up"):
		position.y -= speed * delta

	position.y = clamp(position.y, 0 + paddle_height / 2, screenSize.y - paddle_height / 2)
