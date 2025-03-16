extends Node2D

var OriginalPiece :Node2D
var rightGenSprite :Sprite2D
var leftGenSprite :Sprite2D

@export var genA :Texture2D
@export var genB :Texture2D
@export var genC :Texture2D
@export var genD :Texture2D
@export var genE :Texture2D
@export var genF :Texture2D
@export var genG :Texture2D
@export var genH :Texture2D


func _ready() -> void:
	rightGenSprite = $LeftGen/LeftSprite2D
	leftGenSprite = $RightGen/RightSprite2D
	OriginalPiece = $"../.."
	
	print(OriginalPiece.leftGen.id)
	print(OriginalPiece.rightGen.id)
	
	match OriginalPiece.leftGen.id:
		"A": leftGenSprite.texture = genA
		"B": leftGenSprite.texture = genB
		"C": leftGenSprite.texture = genC
		"D": leftGenSprite.texture = genD
		"E": leftGenSprite.texture = genE
		"F": leftGenSprite.texture = genF
		"G": leftGenSprite.texture = genG
		"H": leftGenSprite.texture = genH
	match OriginalPiece.rightGen.id:
		"A": rightGenSprite.texture = genA
		"B": rightGenSprite.texture = genB
		"C": rightGenSprite.texture = genC
		"D": rightGenSprite.texture = genD
		"E": rightGenSprite.texture = genE
		"F": rightGenSprite.texture = genF
		"G": rightGenSprite.texture = genG
		"H": rightGenSprite.texture = genH
		
