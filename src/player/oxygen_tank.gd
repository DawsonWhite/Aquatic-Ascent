extends Sprite2D

<<<<<<< Updated upstream
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
<<<<<<< Updated upstream
		body.update_o2_time(5)
=======
		if unlocked:
			return
		body.update_o2_time(90)
=======
@export var next_tank: Node2D
var unlocked
@onready var oxygen_bar =  get_node("/root/World/Ui")
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.update_o2_time(20)
		oxygen_bar.time_left=oxygen_bar.MAX_TIME
		if unlocked:
			return
		
		
>>>>>>> Stashed changes
		unlocked = true
	body.activate_checkpoint()
	var camera = get_tree().get_first_node_in_group("Camera")
	
	if camera and next_tank:
		camera.show_next_tank(next_tank.global_position)
>>>>>>> Stashed changes
