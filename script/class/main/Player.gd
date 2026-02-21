extends Entity
class_name Player

var direction = Vector2.RIGHT
var newdir: Vector2
var time: float = 0.0
var canDash = true
var isMoving = false
@onready var input_map = { # Makes the fucking input readable
	"UP" : {
		"direction": Vector2.UP,
		"raycast": $UP
	},
	"DOWN" : {
		"direction": Vector2.DOWN,
		"raycast": $DOWN
	},
	"LEFT" : {
		"direction": Vector2.LEFT,
		"raycast": $LEFT
	},
	"RIGHT" : {
		"direction": Vector2.RIGHT,
		"raycast": $RIGHT
	}}

func _move(dir: Vector2):
	time = 0 # Reset
	global_position += dir * GAME.TILE_SIZE

func _dash(dir: Vector2): 
	var colliding = false
	for input in input_map:
		var action = input_map[input]
		
		if(action["raycast"].is_colliding()):
			colliding = true
	
	if(canDash == true):
		if (Input.is_action_just_pressed("DASH") and not colliding): # need to improve dash limitation to direction
			global_position += 3 * dir * GAME.TILE_SIZE
			canDash = false
		

func _physics_process(_delta: float) -> void:
	
	# Continuous Movement
	time += _delta
	if (time >= GAME.getTickSpeed() - SPEEDMODIFIER):
		_move(direction)
	
	# Movement
	for input in input_map:
		var action = input_map[input]
		
		if(not isMoving):
			if(Input.is_action_pressed(input) and direction != action["direction"] and not action["raycast"].is_colliding()):
				direction = action["direction"]
				isMoving = true
				await get_tree().create_timer(0.2).timeout
				isMoving = false
				break
		_dash(direction)

func _process(delta: float) -> void:
	# Movement and Movement Smoothening
	SPRITE.position = (SPRITE.position + (position - SPRITE.position) * (1 - pow(0.5, delta * GAME.FRAMERATE)))

#  dash cooldown
func _on_timer_timeout() -> void:
	canDash = true
