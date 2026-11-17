extends CharacterBody2D

var SPEED = 100
const GRAVITY = 20

var direction = -1
var facing_right = false
func _ready() -> void:
	add_to_group("Enemy")

func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	velocity.x = SPEED * direction # -= would mean that you are increasing its velocity by -10 each frame

	
	if (!$RayCast2D.is_colliding() && is_on_floor()):
		direction *= -1
		flip()
	
	move_and_slide()

	if is_on_wall():
		direction *= -1
		flip()
func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		pass

func flip():
	facing_right = !facing_right
	scale.x = abs(scale.x) * -1
