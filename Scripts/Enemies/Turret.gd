extends Node2D

@onready var ray_cast = $RayCast2D
@onready var timer = $Timer
@export var ammo : PackedScene
var direction = Vector2.RIGHT

var player
 
func _ready():
	add_to_group("Mobs")
	player =get_tree().get_nodes_in_group("player")[0]

func _physics_process(_delta):
	_aim()
	_check_player_collision()

func _aim():
	direction = (player.position - global_position).normalized()
	ray_cast.target_position = direction * 250 

func _check_player_collision():
	if ray_cast.get_collider() == player and timer.is_stopped():
		timer.start()
	elif ray_cast.get_collider() != player and not timer.is_stopped():
		timer.stop()


func _on_timer_timeout():
	_shoot()

func _shoot():
	var bullet = ammo.instantiate()
	bullet.position = global_position
	bullet.direction = (ray_cast.target_position).normalized()
	get_tree().current_scene.add_child(bullet)
