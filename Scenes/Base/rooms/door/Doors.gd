extends Node2D

@onready var collision_shape_2d = $StaticBody2D/CollisionShape2D
@onready var player_detect = $Player_Detect

func _on_player_detect_body_entered(_body):
	if player_detect.has_overlapping_bodies():
		for a in player_detect.get_overlapping_bodies():
			if a is StaticBody2D:
				collision_shape_2d.queue_free()
