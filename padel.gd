extends Area2D

class_name Padel

@export var jumpDirection = Vector2.RIGHT

const speed = 500;

func _process(delta):
	
	var direction = Input.get_axis("up", "down")
	
	position.y += speed * delta * direction
