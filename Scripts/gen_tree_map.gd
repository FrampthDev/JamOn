extends Node

@export var size : int = 30
var GenMatrix: Array[Array]

var GenTree: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(size):
		GenMatrix.append([])
		for j in range(size):
			GenMatrix[i].append(null)
	GenTree = $".."
	#testMatrix()
	#print(CheckNears(Vector2i(15,15)))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	for i in GenMatrix.size():
		for j in GenMatrix[i].size():
			
			
			
			if GenMatrix[i][j]!= null and find_child(GenMatrix[i][j].get_name()) == null:
				add_child(GenMatrix[i][j])
func CheckNears(c:Vector2i):
	var ret : Array[gen]
	#print(range(max(c.y-1,0), min(c.y+2,size)))
	#range(min(c.x+1,size))
	
	for x in range(max(c.x-1,0), min(c.x+2,size)):
		for y in range(max(c.y-1,0), min(c.y+2,size) ):
			ret.append(GenMatrix[x][y])
	return ret

func testMatrix():
	for i in GenMatrix.size():
		for j in GenMatrix[i].size():
			GenMatrix[i][j] = gen.new()
			
func AddGen(g : gen,c:Vector2):
	GenMatrix[c.x][c.y] = g
