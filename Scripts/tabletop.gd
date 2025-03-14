extends Node2D

@export var nSquaresHeight: int = 32 # Tamaño casillas altura
@export var nSquaresWidth: int = 32 # Tamaño casillas anchura

var square = preload("res://Scenes/square.tscn")
var squareSize = 64
var squareArray: Array

func _init() -> void:
	for i in nSquaresHeight:
		for j in nSquaresWidth:
			squareArray[i][j].append(square.instantiate())
			squareArray[i][j].position = Vector2(j * squareSize, i * squareSize)
			add_child(squareArray[i][j])
			j += 1
		i += 1
