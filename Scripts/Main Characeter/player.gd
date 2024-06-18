extends CharacterBody2D

var speed: float = 10.0 
var max_speed: float = 40.0 
const acceleration = 600
const friction = 1100

@onready var paused = $Camera2D/Paused

var pause = false

var herido = false

@onready var voltear = $Sprite2D

var energyPerShot = 50
var daño= -10

var damageSalud=50
@onready var golpear 


var input = Vector2.ZERO

func _ready():
	Global.life = 1000


func get_input():
	input.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	input.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	return input.normalized()

func player_movement(delta):
	
	input = get_input()
	@warning_ignore("shadowed_variable_base_class")
	var velocity = get_velocity()
	
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * acceleration * delta)
		velocity = velocity.limit_length(max_speed)


	set_velocity(velocity)
	move_and_slide()

func _physics_process(delta):
	get_input()
	muerte()
	player_movement(delta)

func muerte():
	if Global.life == 0:
		get_tree().reload_current_scene()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		pause_menu()

func pause_menu():
	if pause:
		paused.hide()
		Engine.time_scale = 1
		pause = false
	else:
		paused.show()
		Engine.time_scale = 0
		pause = true
