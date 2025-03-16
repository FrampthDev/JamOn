extends Node2D

var piecePrefab = preload("res://Scenes/piece.tscn")
var instantiatedPiece
var PositionCont
var PositionArray
var p :Node2D

func _ready() -> void:
	SignalManager.StartScene(self)
	PositionCont = GameManager.get_node("PositionArray").cont	
	PositionArray = GameManager.get_node("PositionArray").Positions

func InstantiateChild(iMovedPiece: int, jMovedPiece: int, iStaticPiece: int, jStaticPiece: int, squareArray: Array) -> void:	
	instantiatedPiece = piecePrefab.instantiate()
	if (jStaticPiece < jMovedPiece && squareArray[iMovedPiece + 2][jMovedPiece].piece == null && squareArray[iMovedPiece + 2][jMovedPiece - 1].piece == null):
		instantiatedPiece.position = squareArray[iMovedPiece + 2][jMovedPiece].global_position + Vector2(32, 16)
	else: if jStaticPiece > jMovedPiece && squareArray[iMovedPiece + 2][jMovedPiece + 1].piece == null && squareArray[iMovedPiece + 2][jMovedPiece + 2].piece == null:
		instantiatedPiece.position = squareArray[iMovedPiece + 2][jMovedPiece + 2].global_position + Vector2(32, 16)
	add_child(instantiatedPiece)
	SignalManager.buffer[0] = instantiatedPiece

func NewPiece(a:gen,b:gen):
	PositionCont += 1
	p = piecePrefab.instantiate()
	p.position = PositionArray[PositionCont % PositionArray.size()]
	p.leftGen = a
	p.rightGen = b
	add_child(p)
	pass
