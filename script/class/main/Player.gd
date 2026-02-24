extends Entity
class_name Player

var direction = Vector2.RIGHT
var time: float = 0.0
var can_dash = true
var is_moving = false

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
	
func _ready() -> void:
	health = 999
	MAX_HEALTH = 999
	
func _move(dir: Vector2):
	time = 0 
	var target_raycast: RayCast2D = null

	for key in input_map:
		if input_map[key]["direction"] == dir:
			target_raycast = input_map[key]["raycast"]
			break

	if target_raycast != null:

		target_raycast.force_raycast_update()

	if not target_raycast.is_colliding():
		global_position += dir * GAME.TILE_SIZE

func _dash(dir: Vector2): 
	var colliding: RayCast2D
	for input in input_map:
		var action = input_map[input]
		
		if(action["direction"] == dir):
			colliding = input_map[input]["raycast"]
			break
	
	if(can_dash):
		if (Input.is_action_just_pressed("DASH") and not colliding.is_colliding()): # need to improve dash limitation to direction
			global_position += 3 * dir * GAME.TILE_SIZE
			can_dash = false
			await get_tree().create_timer(4.0).timeout
			can_dash = true
		

func _physics_process(_delta: float) -> void:
	
	# Continuous Movement
	time += _delta
	if (time >= GAME.getTickSpeed() - SPEEDMODIFIER):
		_move(direction)
	
	# Movement
	for input in input_map:
		var action = input_map[input]
		
		if(not is_moving):
			if(Input.is_action_pressed(input)):
				direction = action["direction"]
				is_moving = true
				await get_tree().create_timer(0.2).timeout
				is_moving = false
				break
		_dash(direction)

var render_time = 0
func _process(delta: float) -> void:
	# Movement and Movement Smoothening
	render_time += delta
	#print((1 + sin(render_time))/2)
	if (since_hurt != 0): 
		$Sprite2D.modulate.a = 1 - (1 + sin(8*render_time))*.25
	SPRITE.position = (SPRITE.position + (position - SPRITE.position) * (1 - pow(0.5, delta * GAME.FRAMERATE)))
