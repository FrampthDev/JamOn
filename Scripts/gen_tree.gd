extends Node2D


var genNode = preload("res://Scenes/GenTree/gen_node.tscn")
var genArray : Array[gen]

func addGen(id: String, conexions:Array[gen]):
	var newGen = genNode.instantiate()
	newGen.Constructor(id, conexions)
	genArray.append(newGen)
	return newGen

func _init() -> void:
	var A:gen = addGen("A",[])
	var B:gen = addGen("B",[A])
	A.AddConexion(B)
	A.AddConexion(A)
	for g in genArray:
		print(g.id, " " , g.conexions.size())
	
