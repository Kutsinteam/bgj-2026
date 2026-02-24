extends CharacterBody2D
class_name Entity

# Modifiers will be applied via attributes.			# You may use this class for projectiles.
@export var MAX_HEALTH: int = 1
@export var MOVE_SPEED: int = 5
@export var SPEEDMODIFIER = .15

@onready var SPRITE = $Sprite2D

# CRITICAL: Debounce, decides how frequently an entity takes damage.
@export var DEBOUNCETIMER = 5000

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

var since_hurt: int = 0 # ms
var flash_hurt: float
func hurt(amount: int) -> void:
	
	var t = Time.get_ticks_msec() 
	if ((t - since_hurt) > DEBOUNCETIMER):
		health -= amount
		since_hurt = t
		print(amount)
		
		flash_hurt = DEBOUNCETIMER*.001
		
	else: print("DEBOUNCE")
		
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

func _process(delta: float) -> void:
	if (flash_hurt >= 0):
		flash_hurt -= delta
		SPRITE.modulate.a = 1 - (1 + sin(8*flash_hurt))*.25
	else:
		SPRITE.modulate.a = 1
		
	SPRITE.position = (SPRITE.position + (position - SPRITE.position) * (1 - pow(0.5, delta * GAME.FRAMERATE)))
