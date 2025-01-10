extends Node2D

@export var speed = 250  # Movement speed of the AI paddle
@onready var colShape: CollisionShape2D = $CollisionShape2D

var screenSize
var paddle_height

func _ready():
	# Initialize screen size and paddle dimensions
	screenSize = get_viewport_rect().size
	paddle_height = colShape.shape.height + 2 * colShape.shape.radius

func _process(delta):
	# Get the ball's position and velocity
	var ball = get_node("../Ball")
	var ball_position = ball.global_position
	var ball_velocity = ball.velocity

	# Move paddle only if the ball is moving towards it
	if ball_velocity.x > 0:
		if ball_position.y > position.y + paddle_height / 4:
			position.y += speed * delta
		elif ball_position.y < position.y - paddle_height / 4:
			position.y -= speed * delta

	# Clamp position to keep the paddle within screen bounds
	position.y = clamp(position.y, 0 + paddle_height / 2, screenSize.y - paddle_height / 2)
