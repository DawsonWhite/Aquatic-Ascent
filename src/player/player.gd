extends CharacterBody2D

class_name  player

const SPEED = 300.0
<<<<<<< Updated upstream
const JUMP_VELOCITY = -300.0
const GRAVITY = 300.0
=======
const JUMP_VELOCITY = -500.0
const GRAVITY = 1000
const FALL_GRAVITY = 500

@onready var o2_timer = $OutOfO2
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	add_to_group("Player")

func update_o2_time(new_seconds: float) -> void:
	if((o2_timer.time_left + new_seconds) > 60):
		o2_timer.start(60)
	else:
		o2_timer.start(o2_timer.time_left + new_seconds)
	print(o2_timer.wait_time)
>>>>>>> Stashed changes

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
<<<<<<< Updated upstream
		velocity.y += GRAVITY * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
=======
		if velocity.y < 0:
			velocity.y += GRAVITY * delta
		else:
			velocity.y += FALL_GRAVITY * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
<<<<<<< Updated upstream

>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
<<<<<<< Updated upstream
=======
	update_animations(direction)

func update_animations(direction: float) -> void:
	# 1. Flip the sprite based on movement direction
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	# 2. Play the right animation
	if is_on_floor():
		if direction != 0:
			animated_sprite.play("Moving")
		else:
			animated_sprite.play("Idle")

func _on_out_of_o_2_timeout() -> void:
	queue_free()
	#move this to a die function
>>>>>>> Stashed changes
