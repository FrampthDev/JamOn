extends Node2D
var cursorPosition
@export var camera: Camera2D

func _process(delta) -> void:
	
	position = camera.get_global_mouse_position()
