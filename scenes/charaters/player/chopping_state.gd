extends NodeState

@export var player: Player
@export var animated_sprited_2d: AnimatedSprite2D
@export var hit_component_collision_shape: CollisionShape2D

func ready() -> void:
	hit_component_collision_shape.disabled = true
	hit_component_collision_shape.position = Vector2(0, 0)

func _on_process(_delta: float) -> void:
	pass
	
func _on_physyics_process(_dekta: float) -> void:
	pass

func _on_next_transitions() -> void:
	if !animated_sprited_2d.is_playing():
		transition.emit("Idle")

func _on_enter() -> void:
	if player.player_direction == Vector2.UP:
		animated_sprited_2d.play("chopping_back")
		hit_component_collision_shape.position = Vector2(3, -20)
	elif player.player_direction == Vector2.DOWN:
		animated_sprited_2d.play("chopping_front")
		hit_component_collision_shape.position = Vector2(-3, 2)
	elif player.player_direction == Vector2.LEFT:
		animated_sprited_2d.play("chopping_left")
		hit_component_collision_shape.position = Vector2(-9, -1)
	elif player.player_direction == Vector2.RIGHT:
		animated_sprited_2d.play("chopping_right")
		hit_component_collision_shape.position = Vector2(9, -1)
	else:
		animated_sprited_2d.play("chopping_front")
		hit_component_collision_shape.position = Vector2(3, -20)
		
	hit_component_collision_shape.disabled = false

func _on_exit() -> void:
	animated_sprited_2d.stop()
	hit_component_collision_shape.disabled = true
