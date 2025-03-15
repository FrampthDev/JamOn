extends Node2D
@export var LineColor : Color = Color.BROWN
@export var MatrixSize = 30
var genMatrix : Array[Array]

@export var nodePadding:= 40

var genNode = preload("res://Scenes/GenTree/gen_node.tscn")

func initializeMatrix():
	for i in MatrixSize:
		genMatrix.append([])
		for j in MatrixSize:
			genMatrix[i].append(null)
	initGenMatrix()

func addGen(id: String, conexions:Array[gen], c : Vector2i):
	var isIn := false
	var i := 0
	var j := 0
	while i < MatrixSize and !isIn:
		while j < MatrixSize and !isIn:
			if genMatrix[i][j] != null and genMatrix[i][j].id == id:
				print("yes")
				isIn = true
			j+=1
		i+=1
	var newGen : gen= genNode.instantiate()
	newGen.Constructor(id, conexions,c)
	if !isIn: genMatrix[c.x][c.y] = newGen #solo se añade si no esta en la matriz 
	
	return newGen
func initGenMatrix():
	var A: gen = addGen("A",[],Vector2i(10,10))
	var B: gen = addGen("B",[],Vector2i(11,10))
	var C: gen = addGen("C",[],Vector2i(11,11))
	var D: gen = addGen("D",[],Vector2i(10,11))
	A.AddConexion(B)
	A.AddConexion(D)
	B.AddConexion(A)
	B.AddConexion(C)
	C.AddConexion(B)
	C.AddConexion(D)
	D.AddConexion(C)
	D.AddConexion(A)
	
	
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initializeMatrix()
	#DrawMatrix()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in genMatrix.size():
		for j in genMatrix[i].size():
			if genMatrix[i][j] != null and !isInMatrix(genMatrix[i][j]):
				var newGen: gen = genMatrix[i][j]
				add_child(newGen)
				newGen.position = Vector2(i*nodePadding,j*nodePadding)
				
				
func _draw() -> void:
	for i in genMatrix.size():
		for j in genMatrix[i].size():
			
			var g : gen = genMatrix[i][j]
			if g != null:
				for h :gen in g.conexions:
					draw_line(Vector2(i*nodePadding,j*nodePadding),Vector2(h.coordinates.x*nodePadding,h.coordinates.y*nodePadding),LineColor,1,false)
func DrawMatrix():
	for i in genMatrix.size():
		for j in genMatrix.size():
			print(genMatrix[i][j])
func isInMatrix(g : gen):
	var isIn := false 
	var i := 0
	var j := 0
	while i < MatrixSize and !isIn:
		while j < MatrixSize and !isIn:
			if genMatrix[i][j] == g:
				print("yes")
				isIn = true
			j+=1
		i+=1
		return isIn
func searchConexions(g:gen):
	pass
