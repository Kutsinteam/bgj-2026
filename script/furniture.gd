extends Node2D
class_name Furniture

# SIZE: SML (32x32) MED (48x32) LRG (64x32)
# TYPE

func _init(x: int, y: int):
	
	self.x = x;
	self.y = y;
	
	return

func move(x: int, y: int):
	
	# Change later for autoload.
	
	self.y += (x - y) * 8;
	self.x += (x + y) * 16;
	
	return;

# func destroy():
