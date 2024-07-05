extends State
class_name FollowState



func transition():
	if not ray_cast.is_colliding():
		get_parent().change_state("Idle")
	if ray_cast.is_colliding():
		if ray_cast2.is_colliding():
			get_parent().change_state("Attack")
 
func enter():
	super.enter()
	owner.set_physics_process(true)

 
func exit():
	super.exit()
	owner.set_physics_process(false)
