extends Area2D

var golpeDamage = 10
var zonaDeGolpeRadius = 50
var enemigo

func _ready():
	set_process_input(true)

func _input(event):
	if event is InputEventMouseMotion:
		position = get_global_mouse_position()

func _on_Area2D_body_entered(body):
	if body.is_in_group("enemigos"):
		enemigo = body
		GolpearEnemigo()

func _on_Area2D_body_exited(body):
	if body == enemigo:
		enemigo = null

func GolpearEnemigo():
	if enemigo:
		enemigo.vida -= golpeDamage
