extends Entity
class_name Player

@onready var SPRITE = $Sprite2D
@export var MOVESPEED_MODIFIER = 0.5
var direction = Vector2.RIGHT
func _process(delta: float) -> void:
	SPRITE.position = (SPRITE.position + (position - SPRITE.position) * (1 - pow(MOVESPEED_MODIFIER, delta * GAME.FRAMERATE)))

var time: float = 0.0
func _physics_process(_delta: float) -> void:
	
	time += _delta
	if (time >= MOVESPEED_MODIFIER/2):
		_move(direction)
	
	if (Input.is_action_just_pressed("UP") && !$UP.is_colliding()):
		var newdir: Vector2 = Vector2(0, -1)
		if (direction != newdir):
			direction = newdir
			_move(direction)
		
	if (Input.is_action_just_pressed("DOWN") && !$DOWN.is_colliding()):
		var newdir: Vector2 = Vector2(0, 1)
		if (direction != newdir):
			direction = newdir
			_move(direction)
		
	if (Input.is_action_just_pressed("LEFT") && !$LEFT.is_colliding()):
		var newdir: Vector2 = Vector2(-1, 0)
		if (direction != newdir):
			direction = newdir
			_move(direction)
		
	if (Input.is_action_just_pressed("RIGHT") && !$RIGHT.is_colliding()):
		var newdir: Vector2 = Vector2(1, 0)
		if (direction != newdir):
			direction = newdir
			_move(direction)
		
func _move(dir: Vector2):
	time = 0 # Reset
	global_position += dir * GAME.TILE_SIZE
