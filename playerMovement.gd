extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -520.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process (delta) -> void:
	if velocity == Vector2.ZERO:
		$AnimatedSprite2D.play("idle")
	else:
		$AnimatedSprite2D.play("walk")
		if velocity.x < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
		#if Input.is_action_just_pressed("ui_right"):
			#$AnimatedSprite2D.flip_h = false
		#elif Input.is_action_just_pressed("ui_left"):
			#$AnimatedSprite2D.flip_h = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") || Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func setPosition(playerPos: Vector2):
	position = playerPos
