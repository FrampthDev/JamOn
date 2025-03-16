extends Sprite2D

@export var SpriteA: Texture
@export var SpriteB: Texture
@export var SpriteC: Texture
@export var SpriteD: Texture
@export var SpriteE: Texture
@export var SpriteF: Texture
@export var SpriteG: Texture
@export var SpriteH: Texture

var GenNode :Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GenNode = $".."
	
	match GenNode.id:
		"A": texture = SpriteA
		"B": texture = SpriteB
		"C": texture = SpriteC
		"D": texture = SpriteD
		"E": texture = SpriteE
		"F": texture = SpriteF
		"G": texture = SpriteG
		"H": texture = SpriteH


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
