extends Node2D

@export var sizePositions := 10
@export var padding := 20
var initialPositions : Array[Vector2]

func _ready() -> void:
	var vec : Vector2
	vec = position
	for i in sizePositions:
		initialPositions.append(vec)
		vec.y += padding
		#print(initialPositions[i])
