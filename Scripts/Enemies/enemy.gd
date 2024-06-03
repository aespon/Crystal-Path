extends CharacterBody2D
class_name Enemy

var speed = 25
var startpos 
var player = null

func _ready():
	add_to_group("Mobs")
	startpos = global_position
	
func _process(_delta: float) -> void:
	follow()
	
func follow():
	if player != null:
		velocity = global_position.direction_to(player.global_position) * speed
	if player == null:
		if startpos != position:
			velocity = global_position.direction_to(startpos) * 25
		if startpos == position:
			velocity = global_position.direction_to(startpos) * 0
			print("dont move")
	move_and_slide()

func _on_area_2d_area_entered(_area):
	player = get_tree().get_nodes_in_group("player")[0]
	print ("a")


func _on_deagro_area_exited(_area):
	player = null
