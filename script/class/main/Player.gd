extends Entity
class_name Player

var direction = Vector2.RIGHT
var newdir: Vector2
var time: float = 0.0

func _move(dir: Vector2):
	time = 0 # Reset
	global_position += dir * GAME.TILE_SIZE

func _physics_process(_delta: float) -> void:
	
	time += _delta
	if (time >= GAME.getTickSpeed() - SPEEDMODIFIER):
		_move(direction)
	
	if (Input.is_action_just_pressed("UP") && !$UP.is_colliding()):
		
		newdir = Vector2(0, -1)
		if (direction != newdir):
			direction = newdir
			_move(direction)
			
	elif (Input.is_action_just_pressed("DOWN") && !$DOWN.is_colliding()):
		
		newdir = Vector2(0, 1)
		if (direction != newdir):
			direction = newdir
			_move(direction)
			
	elif (Input.is_action_just_pressed("LEFT") && !$LEFT.is_colliding()):
		
		newdir = Vector2(-1, 0)
		if (direction != newdir):
			direction = newdir
			_move(direction)
			
	elif (Input.is_action_just_pressed("RIGHT") && !$RIGHT.is_colliding()):
		
		newdir = Vector2(1, 0)
		if (direction != newdir):
			direction = newdir
			_move(direction)
			
func _process(delta: float) -> void:
	SPRITE.position = (SPRITE.position + (position - SPRITE.position) * (1 - pow(0.5, delta * GAME.FRAMERATE)))
	
