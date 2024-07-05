extends CharacterBody2D

class_name Dog2
@onready var ray_cast = $Detector1
@onready var animation_player = $AnimationPlayer

@onready var player = get_tree().get_nodes_in_group("player")[0]
@onready var ray_cast_2 = $Detector2
@onready var sprite_2d = $Node2D/Sprite2D



var angle_to_player
var player_position


var health: = 1000
var direction = Vector2.RIGHT
var speed  = 100
 
func _ready():
	set_physics_process(false)
 
func _process(delta):
	player_position = player.position
	direction = (player.position - global_position).normalized()
	angle_to_player = global_position.direction_to(player_position).angle()

	# slowly changes the rotation to face the player
	sprite_2d.rotation = move_toward(rotation, angle_to_player, delta*180)
	if health <= 0:
		animation_player.play("Death")
		queue_free()
	
func _physics_process(_delta):
	velocity = direction * speed
	move_and_slide()


 


func _on_hitbox_body_entered(body):
	if body.name == Global.bulletname:
		health = health - Global.daño
		print(health)
