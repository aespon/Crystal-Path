extends CharacterBody2D

var speed: float = 400.0 
var max_speed: float = 400.0 
const acceleration = 32000
const friction = 1100

@export var bala= PackedScene

var input = Vector2.ZERO

func _physics_process(delta):
	player_movement(delta)

func _input(_MOUSE_BUTTON_LEFT):
	disparar()

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



func disparar():
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("shoot"):
		var newbullet = bala.instance()
		newbullet.global_position = $spawn_bala.global_position
		newbullet.direccion= get_global_mouse_position()
		newbullet.rotation_degrees= rotation_degrees
		get_parent().add_child(newbullet)
