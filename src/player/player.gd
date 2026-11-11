extends CharacterBody2D

class_name  player

const SPEED = 300.0
const JUMP_VELOCITY = -300.0
const GRAVITY = 300.0


@onready var o2_timer = $OutOfO2
func _ready() -> void:
	add_to_group("Player")

func update_o2_time(new_seconds: float) -> void:
	if((o2_timer.time_left + new_seconds) > 60):
		o2_timer.start(60)
	else:
		o2_timer.start(o2_timer.time_left + new_seconds)
	print(o2_timer.wait_time)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta


	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	


func _on_out_of_o_2_timeout() -> void:
	queue_free()
	#move this to a die function
