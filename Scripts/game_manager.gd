extends Node2D

var turn : int = 1


func Game_Win() -> void:
	get_tree().change_scene_to_file("res://Scenes/credits_scene.tscn")
