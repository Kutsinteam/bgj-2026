extends Entity
class_name Player

@onready var SPRITE = $Sprite2D
var direction: Vector2 = Vector2(0, 0) 
func _process(delta: float) -> void:
	SPRITE.position = (SPRITE.position + (position - SPRITE.position) * (1 - pow(.5, delta * GAME.FRAMERATE)))

var time: float = 0.0
func _physics_process(_delta: float) -> void:
	
	time += _delta
	if (time >= .1):
		time = 0
		_move(direction)
	
	if (Input.is_action_just_pressed("UP") && !$UP.is_colliding()):
		direction = Vector2(0, -1)
		
	if (Input.is_action_just_pressed("DOWN") && !$DOWN.is_colliding()):
		direction = Vector2(0, 1)
		
	if (Input.is_action_just_pressed("LEFT") && !$LEFT.is_colliding()):
		direction = Vector2(-1, 0)
		
	if (Input.is_action_just_pressed("RIGHT") && !$RIGHT.is_colliding()):
		direction = Vector2(1, 0)
		
func _move(dir: Vector2):
	global_position += dir * GAME.TILE_SIZE
