extends Node2D

signal PieceEnter
signal PieceExit

var cursor
var buffer: Array
var bufferIndex: int = 0
var click: bool = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Click"):
		click = true
	else: if event.is_action_released("Click"):
		click = false

func _process(delta: float) -> void:
	if bufferIndex > 0 && click:
		buffer[0].position = cursor.position

func InitializeCursor(_cursor: Node2D) -> void:
	cursor = _cursor

func _on_piece_enter(piece: Node2D) -> void:
	buffer.append(piece)
	bufferIndex += 1
	print("entrar")

func _on_piece_exit(piece: Node2D) -> void:
	var i: int = 0
	while i < bufferIndex && piece != buffer[i]:
		i += 1		
	if i < bufferIndex - 1: 
		moveLeft(i)
	bufferIndex -= 1
	print("salir")

func moveLeft(i: int) -> void:
	for j in (bufferIndex - i):
		buffer[i + j] = buffer[i + j + 1]
