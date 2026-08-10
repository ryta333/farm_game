extends Sprite2D

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent

var rock_scene = preload("res://scenes/objects/rocks/rock_drop.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print('rock ready')
	hurt_component.hurt.connect(on_hurt)
	damage_component.max_damaged_reached.connect(max_damaged_reached)

func on_hurt(hit_damage: int) -> void:
	damage_component.apply_damage(hit_damage)
	
func max_damaged_reached() -> void:
	call_deferred("add_rock_drop")
	queue_free()
	
func add_rock_drop() -> void:
	var rock_drop_instance = rock_scene.instantiate() as Node2D
	rock_drop_instance.global_position = global_position
	get_parent().add_child(rock_drop_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
