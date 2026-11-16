extends StaticBody2D
class_name breakingPlatform
@onready var delayBreak = $Break
@onready var reappear = $Reappear
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func destroy():
	if delayBreak.is_stopped():
		delayBreak.start()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_delay_fall_timeout() -> void:
	visible = false
	$CollisionShape2D.disabled = true
	delayBreak.stop()
	reappear.start()
	pass # Replace with function body.


func _on_reappear_timeout() -> void:
	visible = true
	$CollisionShape2D.disabled = false
	reappear.stop()
	pass # Replace with function body.
