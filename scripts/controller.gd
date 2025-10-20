extends CharacterBody2D

var SPEED = 80

var direction = 1

@onready var enemey: AnimatedSprite2D = $AnimatedSprite2D
@onready var right_ray_cast: RayCast2D = $"right ray cast"
@onready var left_ray_cast: RayCast2D = $"left ray cast"

func _process(delta: float) -> void:
	if left_ray_cast.is_colliding():
		pass
	else:
		direction = 1
		enemey.flip_h = false
	
	if right_ray_cast.is_colliding():
		pass
	else:
		direction = -1
		enemey.flip_h = true
	
	position.x += direction * SPEED * delta
	
