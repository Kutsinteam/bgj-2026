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

var since_hurt: int = 0
func hurt(amount: int) -> void:
	var t = Time.get_ticks_msec() 
	if ((t - since_hurt) > 900):
		health -= amount
		since_hurt = t
		
	if (health <= 0):
		queue_free()
		return

# In case we need to move some enemies around.		
func teleport(pos: Vector2) -> void:
	velocity = Vector2.ZERO
	position = pos
		
	# Maybe add more behavior here.
		
# func _physics_process(delta: float) -> void:		# TODO: Friction
	
	# velocity.x += 10 * delta
	# move_and_slide()
