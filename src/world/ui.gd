extends CanvasLayer

@onready var oxygen_bar = $OxygenLevel
const MAX_TIME = 20.0
var time_left = MAX_TIME
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	oxygen_bar.max_value = MAX_TIME
	oxygen_bar.value = MAX_TIME
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if time_left > 0:
		time_left -= delta
		oxygen_bar.value = time_left
	pass
