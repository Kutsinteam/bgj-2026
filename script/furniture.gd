extends Node2D
class_name Furniture

var _x: int = 0; # For INTERNAL use only
var _y: int = 0;

func _init(x: int, y: int):
	
	self._x = x;
	self._y = y;
	
	return
