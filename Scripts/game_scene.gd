extends Node2D

var piecePrefab = preload("res://Scenes/piece.tscn")
var instantiatedPiece
var PositionCont
var PositionArray
var p :Node2D
var tabletop : Node2D 


func _ready() -> void:
	tabletop = $Tabletop
	SignalManager.StartScene(self)
	PositionCont = GameManager.get_node("PositionArray").cont
	PositionArray = GameManager.get_node("PositionArray").Positions
	NewPiece(gen.new(),gen.new())

func _process(delta: float) -> void:
	if SignalManager._on_add_age() != null:
		var delgen := SignalManager._on_add_age()
	if SignalManager.destroyPiece != null:
		SignalManager.destroyPiece.queue_free()

func InstantiateChild(i: int, j: int, squareArray: Array) -> void:
		NewChild(gen.new(), gen.new(), squareArray[i][j].global_position + Vector2(32, 16))

func NewPiece(a:gen,b:gen):
	PositionCont += 1
	p = piecePrefab.instantiate()
	p.position = PositionArray[PositionCont % PositionArray.size()]
	p.leftGen = a
	p.rightGen = b
	add_child(p)

	# Si la funcion isleft o right devuelven algo, comprobar si los genes son los buenos e instanciar una ficha nueva con los genes compatibles
	

func destroyPiece():
	pass
func resetConexion(_gen : gen,_genToDelete : gen):
	# borra la conexion g y genera un nuevo nodo 
	_gen.DelConexion(_genToDelete)
	pass

func checkCompatibility():
	pass
	

func NewChild(a: gen, b: gen, pos: Vector2) -> void:
	print("nuevo hijo")
	PositionCont += 1
	p = piecePrefab.instantiate()
	p.position = pos
	p.leftGen = a
	p.rightGen = b
	add_child(p)
	SignalManager.buffer[0] = p
	SignalManager.turn += 1
