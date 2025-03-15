extends Node2D
var PositionArray 
var piece = preload("res://Scenes/piece.tscn")
var p : Node2D


func _ready() -> void:
	PositionArray = $"../PositionArray".Positions
	for i in PositionArray:
		p = piece.instantiate()
		p.position = i
		add_child(p)
		
func NewPiece():
	p = piece.instantiate()
	#  Cambiar posici
	pass
