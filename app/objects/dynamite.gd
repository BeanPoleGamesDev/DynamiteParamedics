extends Node2D

@export var fuse_time = 3.0
var lit = false
@onready var dynamite_fuse_timer = $dynamite_fuse_timer
@onready var area_of_affect = $area_of_affect
@onready var animation_player = $AnimationPlayer

const EXPLOSION_EFFECT = preload("res://app/objects/explosion_effect.tscn")

var knockback_power = 500.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	light_fuse()
	
	
	

func do_knockback(knockbacked_body):
	if knockbacked_body.is_in_group("knockback") or knockbacked_body is RigidBody2D:
		knockbacked_body.linear_velocity += global_position.direction_to(knockbacked_body.global_position) * knockback_power

func light_fuse():
	if lit == false:
		dynamite_fuse_timer.start(fuse_time)
		animation_player.play("explosion")
		
	lit = true

func _on_dynamite_fuse_timer_timeout():
	blow_up()

func blow_up():
	do_explosion_effect()
	SoundGlobal.play_explosion()
	if area_of_affect.has_overlapping_bodies():
		for body in area_of_affect.get_overlapping_bodies():
			do_knockback(body)
	get_parent().queue_free()

func do_explosion_effect():
	var new_explosion = EXPLOSION_EFFECT.instantiate()
	new_explosion.global_position = global_position
	get_tree().current_scene.add_child(new_explosion)
