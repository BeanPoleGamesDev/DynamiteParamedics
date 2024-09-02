extends Node

@export var views: Array[PackedScene]
@export var cut_scene_start: PackedScene
@export var cut_scene_win: PackedScene

var lvl: int = 0

func next_lvl()->void:
	open_lvl(lvl + 1)

func restart_lvl()->void:
	open_lvl(lvl)

func end_start_cut_scene()->void:
	open_lvl(lvl)
	
func win_level()->void:
	lvl+=1
	win_cut_scene()
		
func fail_level()->void:
	restart_lvl()
	
func end_win_cut_scene()->void:
	start_cut_scene()

func open_lvl(idx: int)->void:
	lvl = idx
	if lvl >= views.size():
		lvl = 0
	if get_tree().change_scene_to_packed(views[lvl]) != OK:
		print('failed to load scene: ', lvl)
		
func win_cut_scene()->void:
	if get_tree().change_scene_to_packed(cut_scene_win) != OK:
		print('failed to load win cut scene')
		
func start_cut_scene()->void:
	if get_tree().change_scene_to_packed(cut_scene_start) != OK:
		print('failed to load start cut scene')
		
