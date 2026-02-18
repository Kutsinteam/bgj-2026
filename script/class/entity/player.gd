extends Entity
class_name Player

@onready var SPRITE = $Sprite2D
func _process(delta: float) -> void:
	SPRITE.position = position
	
	if (Input.is_action_just_pressed("UP") && !$UP.is_colliding()):
		_move(Vector2(0, -1))
		
	if (Input.is_action_just_pressed("DOWN") && !$DOWN.is_colliding()):
		_move(Vector2(0, 1))
		
	if (Input.is_action_just_pressed("LEFT") && !$LEFT.is_colliding()):
		_move(Vector2(-1, 0))
		
	if (Input.is_action_just_pressed("RIGHT") && !$RIGHT.is_colliding()):
		_move(Vector2(1, 0))
		
func _move(dir: Vector2):
	global_position += dir * GAME.TILE_SIZE
