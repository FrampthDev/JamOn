extends Node2D

var piece := preload("res://Scenes/piece.tscn")
var initialPositions 

func _init() -> void:
	var a : Node2D = piece.instantiate()
	
	initialPositions = $"../ArrayPositions"
	print(initialPositions)
	#piecePositionsArray.initialPositions[1]
	#a.position = vec
	add_child(a)
	
	pass
	
