extends Node

var life = 1000

var daño = 75

var bulletname = "Bala"

func _process(_delta):
	if life <= 0:
		get_tree().reload_current_scene()
