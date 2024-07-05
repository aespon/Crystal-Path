extends Node2D

var bala = preload("res://Scenes/Base/Player/Bala.tscn")
@onready var BarraEnergia = get_tree().get_nodes_in_group("BarraEnergia")[0]

var energyPerShot = 25
var daño= -10
var vaciado=false

func _ready():
	bala = preload("res://Scenes/Base/Player/Bala.tscn")
	BarraEnergia = get_tree().get_nodes_in_group("BarraEnergia")[0]
	BarraEnergia.resetEnergy()
	vaciado = false

func _process(_delta):
	daño_ctrl()
	if vaciado == true and Input.is_action_just_pressed("recharge"):
		await get_tree().create_timer(0.5).timeout
		BarraEnergia.decreaseEnergy(-200)
		vaciado = false
	look_at(get_global_mouse_position())

func daño_ctrl():
	if BarraEnergia.currentEnergy >= energyPerShot and Input.is_action_just_pressed("shoot") and Engine.time_scale != 0 and(vaciado != true):
		print (BarraEnergia.currentEnergy)
		look_at(get_global_mouse_position())
		disparar()
		BarraEnergia.decreaseEnergy(energyPerShot)
	elif BarraEnergia.currentEnergy <= energyPerShot and Input.is_action_just_pressed("shoot") and Engine.time_scale != 0:
		vaciado=true
		print ("no hay mas plata")

func disparar():
	var newbullet = bala.instantiate()
	get_tree().root.add_child(newbullet)
	newbullet.global_transform= $spawnbullet.global_transform
	print(newbullet.name)
	Global.bulletname = newbullet.name



