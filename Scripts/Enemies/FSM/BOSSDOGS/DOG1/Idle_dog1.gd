extends State
class_name IdleState
 
func transition():

	var target_position = player.position
		 # Check if the player is within the raycast collision
	if ray_cast.is_colliding() and ray_cast.get_collider().get_position() == target_position:
		
			get_parent().change_state("Follow")
			
func enter():
	super.enter()
	owner.set_physics_process(false)

