extends State
func enter():
	super.enter()
	owner.set_physics_process(true)

func transition():
	
	if not ray_cast.is_colliding() or ray_cast.get_collider() != player:
		get_parent().change_state("Stunt")
	

func exit():
	super.exit()
	owner.set_physics_process(false)


