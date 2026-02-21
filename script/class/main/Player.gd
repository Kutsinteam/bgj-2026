extends Entity
class_name Player

var direction = Vector2.RIGHT
var newdir: Vector2
var time: float = 0.0
var canDash = true


func _dash(dir: Vector2): 
	if(canDash == true):
		if Input.is_action_just_pressed("DASH"): # need to improve dash limitation to direction
				_move(dir * 3)
				canDash = false
				
func _move(dir: Vector2):
	
	if (dir.y > 0): # Y-AXIS CHECKS:
		if (!$DOWN.is_colliding()):
			global_position.y += dir.y * GAME.TILE_SIZE
	else:
		if (!$UP.is_colliding()):
			global_position.y += dir.y * GAME.TILE_SIZE
	
	if (dir.x > 0): # X-AXIS CHECKS:
		if (!$RIGHT.is_colliding()):
			global_position.x += dir.x * GAME.TILE_SIZE
	else:
		if (!$LEFT.is_colliding()):
			global_position.x += dir.x * GAME.TILE_SIZE
			
	time = 0 # Reset

func _physics_process(_delta: float) -> void:
	# Continuous Movement
	time += _delta
	if (time >= GAME.getTickSpeed() - .15):
		_move(direction)	
		
	# Movement
	if (Input.is_action_just_pressed("UP")):
		direction = Vector2.UP
		_move(direction)
			
	elif (Input.is_action_just_pressed("DOWN")):
		direction = Vector2.DOWN
		_move(direction)
			
	elif (Input.is_action_just_pressed("LEFT")):
		direction = Vector2.LEFT
		_move(direction)
			
	elif (Input.is_action_just_pressed("RIGHT")):
		direction = Vector2.RIGHT
		_move(direction)
	
	_dash(direction)
	
	# Collision
	if $UP.is_colliding() || $DOWN.is_colliding() || $LEFT.is_colliding() || $RIGHT.is_colliding():
		move_and_collide(direction)
	
func _process(delta: float) -> void:
	# Movement and Movement Smoothening
	SPRITE.position = (SPRITE.position + (position - SPRITE.position) * (1 - pow(0.5, delta * GAME.FRAMERATE)))
	# SPRITE.position = position

#  dash cooldown
func _on_timer_timeout() -> void:
	canDash = true
