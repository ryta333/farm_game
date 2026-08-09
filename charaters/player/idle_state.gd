extends NodeState

@export var player: Player
@export var animiated_sprite_2d: AnimatedSprite2D

func _on_process(_delta: float) -> void:
	pass
	
func _on_physyics_process(_dekta: float) -> void:	
	GameInputEvents.movement_input()
	
	if player.player_direction == Vector2.LEFT:
		animiated_sprite_2d.play("idle_left")
	elif player.player_direction == Vector2.RIGHT:
		animiated_sprite_2d.play("idle_right")
	elif player.player_direction == Vector2.UP:
		animiated_sprite_2d.play("idle_back")
	elif player.player_direction == Vector2.DOWN:
		animiated_sprite_2d.play("idle_front")
	else:
		animiated_sprite_2d.play("idle_front")

func _on_next_transitions() -> void:
	if GameInputEvents.is_movement_input():
		transition.emit("Walk")

	if GameInputEvents.use_tool():	
		if player.current_tool == DataTypes.Tools.AxeWood:
			transition.emit("Chopping")
		elif player.current_tool == DataTypes.Tools.TillGround:
			transition.emit("Tilling")
		elif player.current_tool == DataTypes.Tools.WaterCrops:
			transition.emit('Watering')

func _on_enter() -> void:
	pass

func _on_exit() -> void:
	animiated_sprite_2d.stop()
