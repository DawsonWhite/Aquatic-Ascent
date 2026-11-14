
extends Camera2D

@export var player_node: CharacterBody2D

var is_showing_tank = false

func _ready() -> void:
	add_to_group("Camera")
	make_current()
	global_position = player_node.global_position


func _process(_delta: float) -> void:
	if player_node and not is_showing_tank:
		global_position = player_node.global_position


func show_next_tank(tank_position: Vector2) -> void:
	if is_showing_tank:
		return

	is_showing_tank = true

	# Move camera toward the next tank
	var target_position = Vector2(
		player_node.global_position.x,
		tank_position.y
	)

	var tween = create_tween()
	tween.tween_property(self, "global_position", target_position, 1.0)

	await tween.finished

	# Wait for player to see the next tank
	await get_tree().create_timer(2.0).timeout

	# Return camera to player
	var return_tween = create_tween()
	return_tween.tween_property(
		self,
		"global_position",
		player_node.global_position,
		1.0
	)

	await return_tween.finished

	is_showing_tank = false
