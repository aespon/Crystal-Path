extends Node

var life = 1000

func _process(delta):
	if life == 0:
		get_tree().reload_current_scene()
