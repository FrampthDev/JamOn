extends Node2D

signal PieceEnter
signal PieceExit

signal SquareEnter
signal SquareExit

var cursor
var click: bool = false
var dragged: bool = false

var buffer: Array
var bufferIndex: int = 0

var squareBuffer: Array
var squareBufferIndex: int = 0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Click"):
		click = true	
	else: if event.is_action_released("Click"):
		if dragged:
			buffer[0].position = squareBuffer[0].global_position
		click = false
		dragged = false

func _process(_delta: float) -> void:
	if bufferIndex > 0 && click:
		buffer[0].position = cursor.position
		dragged = true

func InitializeCursor(_cursor: Node2D) -> void:
	cursor = _cursor

func _on_piece_enter(piece: Node2D) -> void:
	buffer.append(piece)
	bufferIndex += 1

func _on_piece_exit(piece: Node2D) -> void:
	var i: int = 0
	while i < bufferIndex && piece != buffer[i]:
		i += 1		
	if i < bufferIndex - 1: 
		moveLeft(i)
	bufferIndex -= 1

func moveLeft(i: int) -> void:
	for j in (bufferIndex - i - 1):
		buffer[i + j] = buffer[i + j + 1]

func _on_square_enter(piece: Node2D) -> void:
	squareBuffer.append(piece)
	squareBufferIndex += 1
	print(squareBufferIndex)

func _on_square_exit(piece: Node2D) -> void:
	var i: int = 0
	while i < squareBufferIndex && piece != squareBuffer[i]:
		i += 1
	if i < squareBufferIndex - 1: 
		moveLeftBuffer(i)
	squareBufferIndex -= 1
	print(squareBufferIndex)

func moveLeftBuffer(i: int) -> void:
	for j in (squareBufferIndex - i - 1):
		squareBuffer[i + j] = squareBuffer[i + j + 1]
