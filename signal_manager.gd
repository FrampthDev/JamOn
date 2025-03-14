extends Node2D

signal PieceEnter
signal PieceExit

var cursor
var buffer: Array
var bufferIndex: int = 0

func InitializeCursor(_cursor: Vector2) -> void:
	cursor = _cursor

func _on_piece_enter(square: Node2D) -> void:
	buffer[bufferIndex] = square
	bufferIndex += 1

func _on_piece_exit(square: Node2D) -> void:
	var i: int = 0
	while i < bufferIndex && square != buffer[i]:
		i += 1		
	if i < bufferIndex - 1: 
		moveLeft(i)
	bufferIndex -= 1

func moveLeft(i: int) -> void:
	for j in (bufferIndex - i):
		buffer[i + j] = buffer[i + j + 1]
