extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: float = 900

var can_move = true
var ouch = false

@onready var animation = $Animation
@onready var collision = $Collision
@export var speed = 100
@export var jump_velocity = -300.0

func _physics_process(delta: float) -> void:
	# Add the gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump
	if Input.is_action_just_pressed("press_up") or Input.is_action_just_pressed("press_space")  and is_on_floor() and can_move:
		velocity.y = jump_velocity

	# Get the horizontal input direction (-1, 0, or 1)
	var direction := Input.get_axis("press_left", "press_right")
	
	if direction != 0 and can_move:
		velocity.x = direction * speed
		animation.flip_h = (direction > 0)
	else:
		# Decelerate smoothly to a stop on the X axis only
		velocity.x = move_toward(velocity.x, 0, speed * delta * 10)

	# Animation states
	if not ouch:
		if not is_on_floor():
			animation.play("Jump") # Adjust to a "Jump" animation if you have one
		elif velocity.x != 0: 
			animation.play("Move")
			animation.speed_scale = 2
		else:
			animation.play("Move")
			animation.speed_scale = 1
	else:
		animation.play("Ouch")

	move_and_slide()

func get_hit() -> void:
	if can_move:
		ouch = true
		can_move = false
		
		# Applies a knockback upward and slightly backward based on facing direction
		var knockback_dir = 1.0 if animation.flip_h else -1.0
		velocity = Vector2(knockback_dir * speed, jump_velocity * 0.6)
		
		collision.set_deferred("disabled", true)
