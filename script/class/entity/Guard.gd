extends Entity
class_name Guard

func _process(delta: float) -> void:
	var target = MAIN.find_child("Player")
	position = (position + (target.position - position) * (1 - pow(.9, delta * GAME.FRAMERATE)))
