extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
var has_ambulance_been_triggered = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_tree().get_nodes_in_group("ambulance").is_empty() and has_ambulance_been_triggered:
		get_tree().call_group("death","death")
		print("death state triggered")
		has_ambulance_been_triggered = false
