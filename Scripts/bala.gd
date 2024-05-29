extends CharacterBody2D

@export var speed = 750
@onready var player = get_tree().get_nodes_in_group("player")[0]

func _physics_process(delta):
	position += transform.x * speed * delta




func _on_area_2d_body_entered(body):
	var mobs = get_tree().get_nodes_in_group("Mobs")[0]
	var enemy = body.owner
	if enemy == mobs :
		enemy.queue_free()
		print ("free")
