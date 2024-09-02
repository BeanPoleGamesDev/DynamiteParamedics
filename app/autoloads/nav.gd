extends Node

@export var views: Array[PackedScene]

var lvl: int = 0

func next_lvl()->void:
	open_lvl(lvl + 1)

func restart_lvl()->void:
	open_lvl(lvl)

func end_start_cut_scene()->void:
	open_lvl(lvl)

func open_lvl(idx: int)->void:
	lvl = idx
	if lvl >= views.size():
		lvl = 0
	if get_tree().change_scene_to_packed(views[lvl]) != OK:
		print('failed to load scene: ', lvl)
		
