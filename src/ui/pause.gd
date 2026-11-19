extends CanvasLayer

@onready var playerInstance = player.new()

func _on_resume_button_pressed() -> void:
	hide()



func _on_quit_button_pressed() -> void:
	get_tree().quit()
	
	


func _on_restart_button_pressed() -> void:
	var player_node = get_tree().get_first_node_in_group("player")
	
	if (player_node):
		player_node.respawn()
