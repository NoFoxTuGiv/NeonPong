extends CharacterBody2D

@export var maxSpeed = 500
@export var maxDeflect = 25.0
var reset_x
var reset_y
var x_vel
var y_vel

func _ready() -> void:
	randomize()
	reset_x = get_viewport_rect().size.x / 2
	reset_y = get_viewport_rect().size.y / 2
	reset_ball()

func _physics_process(delta: float) -> void:
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		var collider = collision_info.get_collider()
		if collider.name == "AIWall" or collider.name == "PlayerWall":
			if collider.name == "AIWall":
				Global.playerScore += 1
			elif collider.name == "PlayerWall":
				Global.aiScore += 1
			reset_ball()
		elif collider.name == "PlayerPaddle" or collider.name == "AIPaddle":
			# Play the blip
			$Blip.play()
			# Calculate deflection based on collision point
			var collision_point = collision_info.get_position()
			var paddle_center = collider.global_position
			var paddle_shape = collider.get_node("CollisionShape2D").shape
			if paddle_shape is CapsuleShape2D:
				var paddle_radius = paddle_shape.radius
				var relative_collision_y = collision_point.y - paddle_center.y
				
				# Invert collision calculation for AI paddle
				if collider.name == "AIPaddle":
					relative_collision_y = -relative_collision_y
				
				var deflection_factor = clamp(relative_collision_y / paddle_radius, -0.5, 0.5)
				var deflection_angle = deflection_factor * maxDeflect  # Max 25 degrees
				var new_velocity = velocity.bounce(collision_info.get_normal())
				new_velocity = new_velocity.rotated(deflection_angle * (PI / 180))  # Convert degrees to radians
				velocity = new_velocity
				velocity.x += 10
			else:
				$Blip.play()
				velocity = velocity.bounce(collision_info.get_normal())
		else:
			$Blip.play()
			velocity = velocity.bounce(collision_info.get_normal())

func reset_ball() -> void:
	position = Vector2(reset_x, reset_y)
	x_vel = randi_range(350, maxSpeed)
	y_vel = maxSpeed - abs(x_vel)
	if randf() > 0.5:
		x_vel *= -1
	velocity = Vector2(x_vel, y_vel)
