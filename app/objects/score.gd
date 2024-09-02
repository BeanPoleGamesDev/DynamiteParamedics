extends Control

@onready var label: Label = $Label

var score = 0

func increment_score():
	score += 1
	label.text = "Score " + str(score)
