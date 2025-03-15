extends Node2D

var coor: int
var occupied: bool

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "AreaPlacement":
		SignalManager.SquareEnter.emit(self)

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "AreaPlacement":
		SignalManager.SquareExit.emit(self)
