extends CharacterBody2D
class_name Entity

# Modifiers will be applied via attributes.			# You may use this class for projectiles.
@export var MAX_HEALTH: int = 1
@export var MOVE_SPEED: int = 5
@onready var SPRITE = $Sprite2D

@export var SPEEDMODIFIER = .15

# @onready var DAMAGE: int = 0 (MOVED, USE EXTENDING CLASS INSTEAD)

var health: int = MAX_HEALTH # Internal use.
func getHp() -> int:
	return health

func _init(hp: int = 1, spd: int = 5) -> void:		# WARNING: _init is REQUIRED to either have
	MAX_HEALTH = hp									# a PARAMETERLESS form or DEFAULT values!!!
	MOVE_SPEED = spd								# It'll break if it doesn't.
	
var MAIN # Security check.
func _ready() -> void:
	MAIN = get_parent()
	if (MAIN.name != "root"):
		print(name + " not in 'Main'!")

func hurt(amount: int) -> void:
	health -= amount
	if (health <= 0):
		queue_free()
		return
		
	# Maybe add more behavior here.
		
# func _physics_process(delta: float) -> void:		# TODO: Friction
	
	# velocity.x += 10 * delta
	# move_and_slide()
