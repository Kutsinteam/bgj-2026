extends Node2D
class_name Furniture

func _init(x: int, y: int):
	
	self.x = x;
	self.y = y;
	
	return

func move(x: int, y: int):
	
	self.y += (x - y) * 8;		# Change later for autoload.
	self.x += (x + y) * 16;
	
	return;

# func destroy():
