extends Area2D

var speed = 1000
var velocity
var playerObject
var direction = 1

@onready var timer: Timer = $Timer

func _ready() -> void:
	playerObject = get_node("../player").get_node("AnimatedSprite2D")
	timer.connect("timeout", _on_timer_timeout)


func _process(delta: float) -> void:
	if direction == 1:
		velocity = Vector2(-1, 0).rotated(rotation_degrees) * speed * delta
		$signal/CPUParticles2D.gravity.x = 300
	else:
		velocity = Vector2(1, 0).rotated(rotation_degrees) * speed * delta
		$signal/CPUParticles2D.gravity.x = -300
	position += velocity


func _on_timer_timeout():
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		print("the enemey died")
		area.get_parent().queue_free()
		queue_free()
		
