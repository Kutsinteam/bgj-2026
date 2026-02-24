extends Entity
class_name Guard

func _process(delta: float) -> void:
	var target = MAIN.find_child("Player")
	if (target):
		velocity += (target.position - position).normalized() * 50 * delta
		if (position.distance_to(target.position) < 10):
			target.hurt(1)
	
	move_and_slide();
	
	
