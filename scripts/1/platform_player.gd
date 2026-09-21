extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -300.0

var can_move = true
var ouch = false

@onready var animation = $Animation
@onready var collision = $Collision

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump
	if Input.is_action_just_pressed("press_space") and is_on_floor():
		AudioManager.play_sfx("jump")
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration
	var direction := Input.get_axis("press_left", "press_right")
	if direction and can_move:
		velocity.x = direction * SPEED
		animation.flip_h = (direction > 0)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if not ouch:
		if not is_on_floor():
			if velocity.y < 0: animation.play("Jump") 
		else:
			animation.play("Move") 
			animation.speed_scale = 2 if velocity.x != 0 else 1
	else:
		animation.play("Ouch")

	move_and_slide()

func get_hit() -> void:
	if can_move:
		ouch = true
		can_move = false
		velocity.y = JUMP_VELOCITY
		collision.set_deferred("disabled", true) 
