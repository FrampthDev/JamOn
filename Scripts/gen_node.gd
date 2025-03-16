class_name	gen extends Node2D
	
var conexions : Array[gen]
var id : String
var coordinates: Vector2i
var cont : int = 0
var age:= 0 
@export var MaxGenAge := 0

@export var spriteConexion : Texture2D

func Constructor(_id : String,_conexions: Array[gen],_coordinates:Vector2i) -> void:
	id = _id
	coordinates = _coordinates
	#conexions.append(_conexions)
	for g in _conexions:
		# No se puede repetir conexiones
		if conexions.count(g) < 1:
		# No se puede tener una autoflecha
			if g.id != id:
				conexions.append(g)
		
func AddConexion(_gen : gen) ->void:
	if conexions.count(_gen) <1:
		if _gen.id != id:
			conexions.append(_gen)

func DelConexion(deleteGen : gen) -> void:
	conexions.erase(deleteGen)
	
func _process(delta: float) -> void:
	if SignalManager.AddAge:
		age += 1
	if age >= MaxGenAge:
		SignalManager.MaxGenAge.emit(self)
