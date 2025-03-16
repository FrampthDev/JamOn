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

func InstantiateChild(i: int, j: int, squareArray: Array) -> void:
		NewChild(gen.new(), gen.new(), squareArray[i][j].global_position + Vector2(32, 16))

func NewPiece(a:gen,b:gen):
	PositionCont += 1
	p = piecePrefab.instantiate()
	p.position = PositionArray[PositionCont % PositionArray.size()]
	p.leftGen = a
	p.rightGen = b
	add_child(p)

func NewChild(a: gen, b: gen, pos: Vector2) -> void:
	print("nuevo hijo")
	PositionCont += 1
	p = piecePrefab.instantiate()
	p.position = pos
	p.leftGen = a
	p.rightGen = b
	add_child(p)
	SignalManager.buffer[0] = instantiatedPiece
