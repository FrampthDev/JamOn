class_name	gen extends Node2D
	
var conexions : Array[gen]
var id : String

func Constructor(_id : String,_conexions: Array[gen]) -> void:
	id = _id
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
