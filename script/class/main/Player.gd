extends Entity
class_name Player

var direction = Vector2.RIGHT
var newdir: Vector2
var time: float = 0.0
var canDash = true
func _move(dir: Vector2):
	time = 0 # Reset
	global_position += dir * GAME.TILE_SIZE

func _dash(dir: Vector2): 
		if(canDash == true):
			
			if (Input.is_action_just_pressed("DASH") && (!$UP.is_colliding() && !$DOWN.is_colliding() && 
				!$LEFT.is_colliding() && !$RIGHT.is_colliding())): # need to improve dash limitation to direction
				global_position += 3 * dir * GAME.TILE_SIZE
				canDash = false
		

func _physics_process(_delta: float) -> void:
	
	# Continuous Movement
	time += _delta
	if (time >= GAME.getTickSpeed() - SPEEDMODIFIER):
		_move(direction)
	
	# Movement
	if (Input.is_action_just_pressed("UP") && direction != Vector2.UP && !$UP.is_colliding()):
		direction = Vector2.UP
		_move(direction)
			
	elif (Input.is_action_just_pressed("DOWN") && direction != Vector2.DOWN && !$DOWN.is_colliding()):
		direction = Vector2.DOWN
		_move(direction)
			
	elif (Input.is_action_just_pressed("LEFT") && direction != Vector2.LEFT && !$LEFT.is_colliding()):
		direction = Vector2.LEFT
		_move(direction)
			
	elif (Input.is_action_just_pressed("RIGHT") && direction != Vector2.DOWN && !$RIGHT.is_colliding()):
		direction = Vector2.RIGHT
		_move(direction)
	
	_dash(direction)
	
	# Collision
	if $UP.is_colliding() || $DOWN.is_colliding() || $LEFT.is_colliding() || $RIGHT.is_colliding():
		move_and_collide(direction)
	
func _process(delta: float) -> void:
	# Movement and Movement Smoothening
	SPRITE.position = (SPRITE.position + (position - SPRITE.position) * (1 - pow(0.5, delta * GAME.FRAMERATE)))
	

#  dash cooldown
func _on_timer_timeout() -> void:
	canDash = true
