extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed('bomb')): 
		var bombScene = load("res://app/objects/Dynamite.tscn")
		var bomb = bombScene.instantiate()
		
		var overlappingBodies = self.get_overlapping_bodies()
		var clickedBlock = overlappingBodies.front()
		if (clickedBlock):
			clickedBlock.add_child(bomb)
	pass
	
func _physics_process(delta: float) -> void:
	var mouse_position = get_global_mouse_position()
	# Move your node to the mouse position
	self.position = mouse_position
