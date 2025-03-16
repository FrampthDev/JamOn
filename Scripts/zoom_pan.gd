extends Camera2D

@export var min_zoom: float = 1.0
@export var max_zoom: float = 4.0

@export var move_speed: float = 280.0

@export var top_limit: float = -200
@export var bottom_limit: float = 200
@export var left_limit: float = -200
@export var right_limit: float = 200

func _ready() -> void:
	zoom *= min_zoom
	

func _input(event):
	# Zoom con la rueda del ratón
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom *= 1.1  # Aumenta un 10%
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom *= 0.9  # Reduce un 10%
		
		zoom.x = clamp(zoom.x, min_zoom, max_zoom)
		zoom.y = clamp(zoom.y, min_zoom, max_zoom)

func _process(delta):
	# Movimiento con WASD o flechas
	if Input.is_action_pressed('Right') and position.x < right_limit:
		position.x += move_speed * delta
	if Input.is_action_pressed('Left') and position.x > left_limit:
		position.x -= move_speed * delta
	if Input.is_action_pressed('Down') and position.y < bottom_limit:
		position.y += move_speed * delta
	if Input.is_action_pressed('Up') and position.y > top_limit:
		position.y -= move_speed * delta
