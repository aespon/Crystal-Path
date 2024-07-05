extends CharacterBody2D

@export var speed = 3500
@onready var player = get_tree().get_nodes_in_group("player")[0]

func _physics_process(delta):
	position += transform.x * speed * delta


