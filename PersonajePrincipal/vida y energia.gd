extends Node2D


var vida_maxima = 100
var vida_actual = vida_maxima


var energia_maxima = 100
var energia_actual = energia_maxima
var regeneracion_energia = 5

var cuerpo

func _process(delta):

	energia_actual = min(energia_actual + regeneracion_energia * delta, energia_maxima)


	#$vida_barra.value = vida_actual / vida_maxima
	#$energia_barra.value = energia_actual / energia_maxima


	if vida_actual <= 0:
		morir()

func _on_Area2D_body_entered(body):
	if body.has_method("recibir_danio"):
		cuerpo = body
		cuerpo.recibir_danio(10)

func morir():
	print("El personaje ha muerto")

func recibir_danio(danio):
	vida_actual = clamp(vida_actual - danio, 0, vida_maxima)
	if vida_actual <= 0:
		morir()
