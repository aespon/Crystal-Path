extends State




func transition():
	
	if ray_cast.is_colliding() and ray_cast.get_collider() == player:
		get_parent().change_state("Attack")
	if not ray_cast.is_colliding():
		get_parent().change_state("Idle")

