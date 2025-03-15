extends Node

var royal_names: Array = []

func _init() -> void: 
	royal_names = _generate_royal_names()
	print(royal_names)

func _to_roman(num: int) -> String:
	
	var roman_num = { 1: 'I', 2: 'II', 3: 'III', 4: 'IV', 5: 'V', 6: 'VI', 7: 'VII', 8: 'VIII', 9: 'IX', 10: 'X'}
	
	return roman_num.get(num, '')

func _generate_royal_names() -> Array:

	var result: Array = []

	if FileAccess.file_exists("res://names.txt"):
		
		var file = FileAccess.open("res://names.txt", FileAccess.READ)
				
		while file.get_position() < file.get_length():
			
			var royal_name = file.get_line().strip_edges()
			
			if royal_name != '':
				var num = randi() % 10 + 1 # generate rnd number between 1-10
				result.append(royal_name + ' ' + _to_roman(num))
				
	else: push_error('res://names.txt no encontrado')
	
	return result

func _get_royal_name() -> String:
	
	if royal_names.is_empty(): royal_names = _generate_royal_names()
	
	var idx = randi() % royal_names.size()
	
	return royal_names.pop_at(idx)
