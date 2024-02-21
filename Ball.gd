extends Area2D

var direction = get_random_vector()
var DEFAULT_SPEED = 500
var _speed = DEFAULT_SPEED

@onready var _initial_pos = position

func _process(delta):
	_speed += delta * 5
	position += _speed * delta * direction

func reset():
	direction = get_random_vector()
	position = _initial_pos
	_speed = DEFAULT_SPEED

func _on_area_entered(area):
	print("ball entered wall")
	print(area)
	
	if area is Wall:
		direction.y = area.jumpDirection.y
	
	if area is Padel:
		direction.x = area.jumpDirection.x
		
	if area is ScoreWall:
		reset()
	
func get_random_direction():
	if randf() <= 0.5:
		return -1
	else:
		return 1

func get_random_vector():
	var xDirection = get_random_direction()
	var yDirection = get_random_direction()
		
	return Vector2(xDirection, yDirection)
