extends State


func transition():
	var target_position = player.position
		 # Check if the player is within the raycast collision
	if ray_cast.is_colliding() and ray_cast.get_collider().get_position() == target_position:
		get_parent().change_state("Attack")
	if ray_cast2.is_colliding() and ray_cast2.get_collider().get_position() == target_position:
		get_parent().change_state("Attack")
	
	


