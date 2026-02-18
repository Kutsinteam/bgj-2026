extends CharacterBody2D
class_name Entity

# Modifiers will be applied via attributes.

@export var MAX_HEALTH: int = 1
@export var MOVE_SPEED: int = 5

var health: int = MAX_HEALTH # Internal use only.
func getHp() -> int:
	return health

func _init(hp: int, spd: int) -> void:
	MAX_HEALTH = hp
	MOVE_SPEED = spd
	
func hurt(amount: int) -> void:
	health -= amount
	if (health <= 0):
		queue_free()
		return
