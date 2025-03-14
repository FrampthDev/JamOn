extends Node2D
@export var camera: Camera2D

func _init() -> void:
	SignalManager.InitializeCursor(self.position)

func _process(delta: float) -> void:
	position = camera.get_global_mouse_position()
