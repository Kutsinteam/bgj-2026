extends Node2D;
class_name Furniture;

var sprite: Sprite2D;

func _init(_spriteName: String, x: int = 0, y: int = 0):
	
	# sprite = Sprite2D.new();
	# add_child(sprite);
	
	# Load sprite.
	
	self.x = x;
	self.y = y;
	
	return;

func move(x: int, y: int):
	
	# Change later for autoload.
	
	self.y += (x - y) * 8;
	self.x += (x + y) * 16;
	
	return;

# func destroy():
