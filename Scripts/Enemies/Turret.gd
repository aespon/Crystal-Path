extends Node2D

@onready var ray_cast = $RayCast2D
@onready var timer = $Timer
@export var ammo : PackedScene

var Jugador
 
func _ready():
	add_to_group("Mobs")
	Jugador=get_tree().get_nodes_in_group("player")[0]

func _physics_process(_delta):
	_aim()
	_check_player_collision()

func _aim():
	ray_cast.target_position = to_local(Jugador.global_position)

func _check_player_collision():
	if ray_cast.get_collider() == Jugador and timer.is_stopped():
		timer.start()
	elif ray_cast.get_collider() !=Jugador and not timer.is_stopped():
		timer.stop()


func _on_timer_timeout():
	_shoot()

func _shoot():
	var bullet = ammo.instantiate()
	bullet.position = global_position
	bullet.direction = (ray_cast.target_position).normalized()
	get_tree().current_scene.add_child(bullet)
