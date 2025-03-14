extends Node2D

var gen
var genArray : Array
var genNode = preload("res://Scenes/GenTree/gen_node.tscn")

func addGen(id, conexions):
	gen = genNode.instantiate()
	gen.Constructor("a", conexions)
	genArray.append(gen)

func _init() -> void:
	addGen("A",[])
	for n in genArray:
		print(n.id)
