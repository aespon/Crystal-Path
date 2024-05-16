extends CharacterBody2D
class_name Enemy

var speed = 50

var player = null

func _ready():
	pass
	
func _process(_delta: float) -> void:
	follow()
	
func follow():
	if player != null:
		velocity = global_position.direction_to(player.global_position) * speed
		
		move_and_slide()
		


func _on_area_2d_body_entered(body):
	player = get_tree().get_nodes_in_group("Jugador")[0]
	
