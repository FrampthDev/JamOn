extends Node2D

signal PieceEnter
signal PieceExit

signal SquareEnter
signal SquareExit

var squareArray

var cursor
var click: bool = false
var dragged: bool = false
var swap: bool = false
var justStarted: bool = true

var buffer: Array
var bufferIndex: int = 0

var squareBuffer: Array
var squareBufferIndex: int = 0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Click"):
		click = true
		if !justStarted:
			OccupySquare()
		justStarted = false
	else: if event.is_action_released("Click"):
		if dragged && !buffer[0].squareBuffer[0].occupied:
			buffer[0].position = buffer[0].squareBuffer[0].global_position + Vector2(32, 16)
			OccupySquare()
		click = false
		dragged = false
	if dragged && event.is_action_pressed("SwapGens"):
		swap = true

func _init() -> void:
	for i in 8:
		buffer.append(null)

func _process(_delta: float) -> void:
	if bufferIndex > 0 || dragged: 
		if click:
			buffer[0].position = cursor.position
			dragged = true
			if swap:
				buffer[0].switchGens()
				swap = false

func InitializeCursor(_cursor: Node2D) -> void:
	cursor = _cursor

func _on_piece_enter(piece: Node2D) -> void:
	buffer[bufferIndex] = piece
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
	buffer[0].SquareEnter(piece)

func _on_square_exit(piece: Node2D) -> void:
	buffer[0].SquareExit(piece)

func moveLeftBuffer(i: int) -> void:
	buffer[0].MoveLeftBuffer(i)

func OccupySquare() -> void:
	var i: int = 0
	var j: int = 0
	
	while i < 32 && buffer[0].squareBuffer[0] == squareArray[i][j]:
		while j < 32 && buffer[0].squareBuffer[0] == squareArray[i][j]:
			j += 1
	i += 1
	
	squareArray[i][j].occupied = !squareArray[i][j].occupied
	squareArray[i][j + 1].occupied = !squareArray[i][j + 1].occupied

func Start(array: Array) -> void:
	squareArray = array
