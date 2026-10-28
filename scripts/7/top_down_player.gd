extends CharacterBody2D

const SPEED = 120.0

var can_move = true
var ouch = false

@onready var animation = $Animation
@onready var collision = $Collision

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("press_left", "press_right", "press_up", "press_down")
	
	if direction != Vector2.ZERO and can_move:
		velocity = direction * SPEED

		if direction.x != 0:
			animation.flip_h = (direction.x > 0)
	else:
		# Decelerate smoothly to a stop on both axes
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)

	# Animation states
	if not ouch:
		if velocity != Vector2.ZERO:

			animation.play("Move")
			animation.speed_scale = 2
		else:
			animation.play("Move") # Adjust to an "Idle" animation if you have one
			animation.speed_scale = 1
	else:
		animation.play("Ouch")

	move_and_slide()

func get_hit() -> void:
	if can_move:
		ouch = true
		can_move = false
		# Applies a slight knockback upward on the screen
		velocity = Vector2.UP * SPEED 
		collision.set_deferred("disabled", true)
