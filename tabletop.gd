extends Node2D

@export var nSquaresHeight: int = 32 # Tamaño casillas altura
@export var nSquaresWidth: int = 32 # Tamaño casillas anchura

var square = preload("res://Scenes/square.tscn")
var squareSize = 128

func _init() -> void:
	for i in nSquaresHeight:
		for j in nSquaresWidth:
			var _square = square.instantiate()
			_square.position = Vector2(j * squareSize, i * squareSize)
			add_child(_square)
			#child.position = Vector2 (i, j)
			j += 1
		i += 1
