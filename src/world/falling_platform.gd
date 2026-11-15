extends AnimatableBody2D
class_name fallingPlatform
const GRAVITY = 500
@onready var delayFall = $DelayFall
var timerStarted = false
var broken = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func hit():
	delayFall.start()
	timerStarted = true
	pass
func destroy():
	queue_free()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if delayFall.time_left <= 0 and timerStarted==true:
		broken = true
		destroy()
	
	pass
