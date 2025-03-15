extends Node2D

var genNode = preload("res://Scenes/GenTree/gen_node.tscn")
var genArray : Array[gen]
var genMap: Node

func addGen(id: String, conexions:Array[gen], c : Vector2i):
	var isIn := false
	var i := 0
	
	var newGen : gen= genNode.instantiate()
	newGen.Constructor(id, conexions)
	genArray.append(newGen)
	
	return newGen
	

func _init() -> void:
	initTabletop()
	for g in genArray:
		print(g.id, " " , g.conexions.size())
	genMap = $GenTreeMap
	

func initTabletop():
	var A: gen = addGen("A",[],Vector2i(1,1))
	var B: gen = addGen("B",[],Vector2i(1,1))
	var C: gen = addGen("C",[],Vector2i(1,1))
	var D: gen = addGen("D",[],Vector2i(1,1))
	
	A.AddConexion(B)
	A.AddConexion(C)
	B.AddConexion(A)
	B.AddConexion(D)
	D.AddConexion(B)
	D.AddConexion(C)
	C.AddConexion(D)
	C.AddConexion(A)
	
	pass
