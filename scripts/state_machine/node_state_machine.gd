class_name NodeStateMachine
extends Node

@export var initial_node_state: NodeState

var node_state: Dictionary = {}
var current_node_state: NodeState
var current_node_state_name: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child is NodeState:
			node_state[child.name.to_lower()] = child
			child.transition.connect(transition_to)
	if initial_node_state:
		initial_node_state._on_enter()
		current_node_state = initial_node_state


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if current_node_state:
		current_node_state._on_process(delta)

func _physics_process(delta: float) -> void:
	if current_node_state:
		current_node_state._on_physyics_process(delta)
		current_node_state._on_next_transitions()

func transition_to(node_state_name: String) -> void:
	if node_state_name == current_node_state.name.to_lower():
		return
	var new_node_state = node_state.get(node_state_name.to_lower()) as NodeState
	 
	if !new_node_state:
		return
	
	if current_node_state:
		current_node_state._on_exit()
	
	new_node_state._on_enter()
	
	current_node_state = new_node_state
	current_node_state_name = current_node_state.name.to_lower()
	
