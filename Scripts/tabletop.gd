extends Node2D

@export var nSquaresHeight: int = 8 # Tamaño casillas altura
@export var nSquaresWidth: int = 28 # Tamaño casillas anchura

var square = preload("res://Scenes/square.tscn")
var squareSize = 32
var squareArray: Array[Array]

func _init() -> void:
	for i in nSquaresHeight:
		squareArray.append([])
		for j in nSquaresWidth:
			squareArray[i].append(j)
			squareArray[i][j] = square.instantiate()
			if j < 14:
				squareArray[i][j].position = Vector2(j * squareSize, i * squareSize)
			else:
				squareArray[i][j].position = Vector2(j * squareSize + 64, i * squareSize)
			squareArray[i][j].coor = Vector2(i, j)
			add_child(squareArray[i][j])
	SignalManager.Start(squareArray)
	print(squareArray)
