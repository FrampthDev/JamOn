extends Node2D

var piecePrefab = preload("res://Scenes/piece.tscn")
var instantiatedPiece

func _init() -> void:
	SignalManager.StartScene(self)

func InstantiateChild(iMovedPiece: int, jMovedPiece: int, iStaticPiece: int, jStaticPiece: int, squareArray: Array) -> void:	
	instantiatedPiece = piecePrefab.instantiate()
	if (jStaticPiece < jMovedPiece):
		instantiatedPiece.position = squareArray[iMovedPiece + 2][jMovedPiece].global_position + Vector2(32, 16)
	else:
		instantiatedPiece.position = squareArray[iMovedPiece + 2][jMovedPiece + 2].global_position + Vector2(32, 16)
	add_child(instantiatedPiece)
