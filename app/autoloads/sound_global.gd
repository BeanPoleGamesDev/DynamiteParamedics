extends Node


@onready var rock_break: AudioStreamPlayer = $rock_break
@onready var helicopter: AudioStreamPlayer = $helicopter
@onready var siren: AudioStreamPlayer = $siren
@onready var explosion: AudioStreamPlayer = $explosion


func play_explosion():
	explosion.play()
