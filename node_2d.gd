extends Node2D


var test := 10
signal testsignal(test)

var numero 



func Hola():
	print("hola")
	
func Update() -> void:
	print("caca")
func _init() -> void:
	Hola()

func _on_button_pressed() -> void:
	testsignal.emit(test)
