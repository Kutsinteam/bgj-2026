extends Node2D
class_name Furniture

@export var orientation: int = 0 # Will refer to a spritesheet.

func _init(x: int = 0, y: int = 0):
	
	position.x = x
	position.y = y

func move(x: int, y: int, _anim: int = 0):
	
	# Change later for autoload.
	
	position.y += (x - y) * 8
	position.x += (x + y) * 16
	
	return

# func destroy():
#	queue_free();
