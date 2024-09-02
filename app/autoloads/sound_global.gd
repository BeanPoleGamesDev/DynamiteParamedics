extends Node


@onready var rock_break: AudioStreamPlayer = $rock_break
@onready var helicopter: AudioStreamPlayer = $helicopter
@onready var siren: AudioStreamPlayer = $siren
@onready var explosion: AudioStreamPlayer = $explosion


func play_explosion():
	explosion.play()

func play_helicopter():
	helicopter.play()

func play_siren():
	siren.play()

func play_rock_break():
	rock_break.play()
