extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false

func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_P):
		visible = !visible
		get_tree().paused = visible



func _on_resume_pressed() -> void:
	visible = false
	get_tree().paused = false


func _on_restart_pressed() -> void:
	var player = get_tree().get_first_node_in_group("Player")
	get_tree().paused = false
	visible = false
	
	if player:
		player.respawn()

func _on_quit_pressed() -> void:
	get_tree().quit()
