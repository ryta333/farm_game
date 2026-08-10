extends StaticBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var interactable_component: InteractableComponent = $InteractableComponent


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactable_component.connect("interactable_activated", on_interactable_activated)
	interactable_component.connect("interactable_deactivated", on_interactable_deactivated)

func on_interactable_activated() -> void:
	animated_sprite_2d.play("open_door")
	#切换图层可以取消碰撞
	collision_layer = 2
	#collision_shape_2d.set_deferred("disabled", true)
	print('activated')

func on_interactable_deactivated() -> void:
	animated_sprite_2d.play("close_door")
	#collision_shape_2d.set_deferred("disabled", false)
	collision_layer = 1
	print('deactivated')
