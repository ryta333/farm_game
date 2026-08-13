extends NodeState

@export var player: Player
@export var animiated_sprite_2d: AnimatedSprite2D
@export var speed: int = 20

func _on_process(_delta: float) -> void:
	pass
	
func _on_physyics_process(_dekta: float) -> void:	
	var direction: Vector2 = GameInputEvents.movement_input()
		
	if direction == Vector2.LEFT:
		animiated_sprite_2d.play("walk_left")
	elif direction == Vector2.RIGHT:
		animiated_sprite_2d.play("walk_right")
	elif direction == Vector2.UP:
		animiated_sprite_2d.play("walk_back")
	elif direction == Vector2.DOWN:
		animiated_sprite_2d.play("walk_front")
	else:
		animiated_sprite_2d.play("walk_front")
		
	if direction != Vector2.ZERO:
		player.player_direction = direction
	
	player.velocity = direction * speed
	player.move_and_slide()

func _on_next_transitions() -> void:
	if !GameInputEvents.is_movement_input():
		transition.emit("Idle")

func _on_enter() -> void:
	pass

func _on_exit() -> void:
	animiated_sprite_2d.stop()
