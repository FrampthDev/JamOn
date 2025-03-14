extends Node2D

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "AreaMouse":
		SignalManager.PieceEnter.emit(self)

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "AreaMouse":
		SignalManager.PieceExit.emit(self)
