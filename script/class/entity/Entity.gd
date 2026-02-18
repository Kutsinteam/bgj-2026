extends CharacterBody2D
class_name Entity

# Modifiers will be applied via attributes.

@export var MAX_HEALTH: int = 1
@export var MOVE_SPEED: int = 5

var health: int = MAX_HEALTH # Internal use only.
func getHp() -> int:
	return health

func _init(hp: int = 1, spd: int = 5) -> void:		# WARNING: _init is REQUIRED to either have
	MAX_HEALTH = hp									# a PARAMETERLESS form or DEFAULT values!!!
	MOVE_SPEED = spd								# It'll break if it doesn't
	
func hurt(amount: int) -> void:
	health -= amount
	if (health <= 0):
		queue_free()
		return
		
# func _physics_process(delta: float) -> void:		# TODO: Friction
	
	# velocity.x += 10 * delta
	# move_and_slide()
