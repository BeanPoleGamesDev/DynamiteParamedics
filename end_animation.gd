extends Node2D

func _ready() -> void:
	SoundGlobal.play_siren()

func _on_animated_sprite_2d_animation_finished() -> void:
	Nav.end_win_cut_scene()
	
