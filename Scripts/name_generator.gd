extends Node

var royal_names: Array = []
var animals: Dictionary = {} # animal_name + img_path

func _ready() -> void: #Aquí si hay que dejar el _init
	
	generate_royal_names()
		
	generate_animal_names()

func to_roman(num: int) -> String:
	
	var roman_num = { 1: 'I', 2: 'II', 3: 'III', 4: 'IV', 5: 'V', 6: 'VI', 7: 'VII', 8: 'VIII', 9: 'IX', 10: 'X'}
	
	return roman_num.get(num, '')

func generate_royal_names() -> void:

	if FileAccess.file_exists("res://names.txt"):
		
		var file = FileAccess.open("res://names.txt", FileAccess.READ)
				
		while file.get_position() < file.get_length():
			
			var royal_name = file.get_line().strip_edges()
			
			if royal_name != '':
				var num = randi() % 10 + 1 # generate rnd number between 1-10
				royal_names.append(royal_name + ' ' + to_roman(num))
			
	else: push_error("res://names.txt no encontrado")
	
func generate_animal_names() -> void:
	
	if DirAccess.dir_exists_absolute("res://Sprites/Animals/"):
		
		var dir = DirAccess.open("res://Sprites/Animals/")
		
		dir.list_dir_begin()
		
		var file_name = dir.get_next()
		
		while dir.get_next() != "":
			animals[file_name.get_basename()] = "res://Sprites/Animals/" + file_name
			file_name = dir.get_next()
		dir.list_dir_end()
	
	else: push_error("res://Sprites/Animals/ no encontrado")

func get_royal_animal() -> Dictionary:

	if royal_names.is_empty(): generate_royal_names()
	
	var idx = randi() % royal_names.size()
	
	var rnd_royal_name = royal_names.pop_at(idx)
	
	var rnd_animal_key = animals.keys()[randi() % animals.size()]
	
	var img_dir = animals.get(rnd_animal_key)
	
	var full_name = rnd_royal_name + ' ' + rnd_animal_key
	
	return { full_name: img_dir }
