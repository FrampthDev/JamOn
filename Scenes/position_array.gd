extends Node2D

var Positions :Array[Vector2]
var vec : Vector2
@export var positionsSize : int = 10
@export var padding : int = 4


func _ready() -> void:
	vec = position
	for i in positionsSize:
		Positions.append(vec)
#		print(vec)
		vec.y += 10*padding
			
