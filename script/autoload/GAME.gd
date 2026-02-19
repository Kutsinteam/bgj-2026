extends Node

@onready var TILE_SIZE: Vector2 = Vector2(16, 16)
@onready var FRAMERATE: int = 60
@onready var TICK: int = 3 # Internal use.
func getTickSpeed() -> float:
	return 1.0/TICK

var AUTHORS: Dictionary = {
	
	"Member 1": "Gabriel",
	"Member 2": "Santino",
	"Member 3": "Jack",
	"Member 4": "Francis",
	
}
