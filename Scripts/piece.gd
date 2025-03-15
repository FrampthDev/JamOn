extends Node2D

var leftGen: Node2D
var rightGen: Node2D
var flipX: bool

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "AreaMouse":
		SignalManager.PieceEnter.emit(self)

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "AreaMouse":
		SignalManager.PieceExit.emit(self)

func _init() -> void:
	#leftGen = (gen)
	#rightGen = (gen)
	pass

func switchGens() -> void:
	var temp = leftGen
	leftGen = rightGen
	rightGen = temp
	
	flipX = !flipX
	$Icon.set_flip_h(flipX)
	
	print("piece flipped ", "flipX ", flipX)
