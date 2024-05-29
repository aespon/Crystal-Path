extends Area2D

var daño= 10
var Enemigo
@onready var golpear 

func _on_area_entered(area):
	var mob = area.owner
	if area.owner == Enemigo:
		print ("enemigo")

func _on_body_entered(body):
	pass

func action_is_press():
	if action_is_press():
		print("goplpeado")



