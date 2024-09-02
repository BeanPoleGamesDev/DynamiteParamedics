extends Node2D


func _on_area_2d_body_entered(body):
	if body.is_in_group("ambulance"):
		$Timer.start(3)
		get_tree().call_group("win","level_complete")


func _on_timer_timeout() -> void:
	Nav.win_level()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("ambulance"):
		$Timer.stop()
