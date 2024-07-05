extends State
class_name AttackD1


func transition():
	if not ray_cast2.is_colliding():
		if not ray_cast.is_colliding():
			get_parent().change_state("Idle")
		if ray_cast.is_colliding():
			get_parent().change_state("Follow")
	


