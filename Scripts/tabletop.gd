extends Node2D

@export var nSquaresHeight: int = 32 # Tamaño casillas altura
@export var nSquaresWidth: int = 32 # Tamaño casillas anchura

var square = preload("res://Scenes/square.tscn")
var squareSize = 32
var squareArray: Array[Array]

func _init() -> void:		
	for i in nSquaresWidth:
		squareArray.append([])
		for j in nSquaresWidth:
			squareArray[i].append(j)
			squareArray[i][j] = square.instantiate()
			squareArray[i][j].position = Vector2(j * squareSize, i * squareSize)
			add_child(squareArray[i][j])
