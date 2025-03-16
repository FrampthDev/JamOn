extends Node2D
var PositionArray 
var piece = preload("res://Scenes/piece.tscn")
var p : Node2D
var PositionCont

func _ready() -> void:
	PositionArray = $"../PositionArray".Positions
	PositionCont = $"../PositionArray".cont

	#NewPiece(gen.new(),gen.new())
	#NewPiece(gen.new(),gen.new())
	#NewPiece(gen.new(),gen.new())
	#NewPiece(gen.new(),gen.new())

	#NewPiece()
	#NewPiece()
