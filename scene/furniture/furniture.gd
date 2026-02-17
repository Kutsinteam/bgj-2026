extends Node2D
class_name Furniture

@export var orientation: int = 0 # Will refer to a spritesheet.

func _init(_x: int = 0, _y: int = 0):
	
	# self.x = x
	# self.y = y
	
	return;

func move(x: int, y: int):
	
	# Change later for autoload.
	
	self.y += (x - y) * 8
	self.x += (x + y) * 16
	
	return

# func destroy():
#	queue_free();
