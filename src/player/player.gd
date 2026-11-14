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
		

>>>>>>> Stashed changes
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
