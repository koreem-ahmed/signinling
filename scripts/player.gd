extends CharacterBody2D

var SIGNAL = preload("res://scenes/signal.tscn")
const SPEED = 300.0
const JUMP_VELOCITY = -300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var player: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	
	var direction := Input.get_axis("left", "right")
	
	if direction > 0:
		player.flip_h = false
	elif direction < 0:
		player.flip_h = true
	
	if is_on_floor():
		if direction == 0:
			player.play("idle")
		else:
			player.play("walking")
	else:
		player.play("jump")
	
	if Input.is_action_just_pressed("attack"):
		var signal_node = load("res://scenes/signal_area.tscn")
		var new_signal = signal_node.instantiate()
		if player.flip_h == false:
			new_signal.direction = -1
		else:
			new_signal.direction = 1
			
		new_signal.set_position(%Signal_spawner.global_transform.origin)
		get_parent().add_child(new_signal)
	
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
