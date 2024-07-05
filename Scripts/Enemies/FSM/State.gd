extends Node2D
class_name State
#Abstract Class
 
@onready var player = get_tree().get_nodes_in_group("player")[0]
@onready var ray_cast = owner.find_child("Detector1")
@onready var ray_cast2 = owner.find_child("Detector2")
@onready var debug = owner.find_child("debug")
@onready var animation_player = owner.find_child("AnimationPlayer")

@onready var enemy = owner
 
func _ready():
	set_physics_process(false)
 
func enter():
	set_physics_process(true)
 
func exit():
	set_physics_process(false)
 
func transition():
	pass
 
func _physics_process(_delta):
	transition()
	debug.text = name
	animation_player.play(name)
