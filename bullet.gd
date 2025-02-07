extends CharacterBody2D


var direction = Vector2.ZERO
var speed = 500
var bounce


func _ready() -> void:
	velocity = direction * speed

func _physics_process(delta: float) -> void:
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		if bounce > 0:
			velocity = velocity.bounce(collision_info.get_normal())
			rotation = velocity.angle()
			bounce -= 1
		else:
			queue_free()
