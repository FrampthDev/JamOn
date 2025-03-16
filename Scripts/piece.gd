extends Node2D

var leftGen: gen
var rightGen: gen

var flipX: bool

var squareBuffer: Array
var squareBufferIndex: int = 0

var justStarted: bool = true

var life: int = 5
var piece_name: String

func SquareEnter(square: Node2D) -> void:
	squareBuffer[squareBufferIndex] = square
	squareBufferIndex += 1
	print(squareBufferIndex)

func SquareExit(square: Node2D) -> void:
	var i: int = 0
	while i < squareBufferIndex && square != squareBuffer[i]:
		i += 1
	if i < squareBufferIndex - 1: 
		MoveLeftBuffer(i)
	squareBufferIndex -= 1
	print(squareBufferIndex)

func MoveLeftBuffer(i: int) -> void:
	for j in (squareBufferIndex - i - 1):
		squareBuffer[i + j] = squareBuffer[i + j + 1]

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "AreaMouse":
		$AreaPickUp/Label.visible = true
		SignalManager.PieceEnter.emit(self)

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "AreaMouse":
		$AreaPickUp/Label.visible = false
		SignalManager.PieceExit.emit(self)
func _init() -> void:
	leftGen = gen.new()
	rightGen = gen.new()
	leftGen.Constructor("A",[],Vector2i(10,10))
	rightGen.Constructor("B",[],Vector2i(11,10))

func _ready() -> void:

		
	assign_name_and_img()
	
	$AreaPickUp/Label.visible = false
	
	for i in 8:
		squareBuffer.append(null)
	#leftGen = (gen)
	#rightGen = (gen)

func switchGens() -> void:
	var temp = leftGen
	leftGen = rightGen
	rightGen = temp
	
	flipX = !flipX
	
	$Icon.set_flip_h(flipX)
	
	print("piece flipped ", "flipX ", flipX)

func on_generation_up() -> void:
	life -= 1
	#animation++
	if life <= 0: kill_piece()

func kill_piece() -> void:
	#var pos = 
	#SignalManager.squareArray[][] = null
	queue_free()

func assign_name_and_img() -> void:
	
	var royal_animal = GameManager.get_node("NamesGenerator").get_royal_animal()
	
	piece_name = royal_animal.keys()[0]
	
	$AreaPickUp/Label.text = piece_name
	
	$Icon.texture = load(royal_animal[piece_name])
