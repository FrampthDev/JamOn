extends Node2D
@export var camera: Camera2D

<<<<<<< Updated upstream
func _process(delta) -> void:
	
=======
func _init() -> void:
	SignalManager.InitializeCursor(self.position)

func _process(delta: float) -> void:
>>>>>>> Stashed changes
	position = camera.get_global_mouse_position()
