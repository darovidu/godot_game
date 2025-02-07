extends CharacterBody2D


var direction = Vector2.ZERO
var speed = 50000
var bounce = 0


func _physics_process(delta: float) -> void:
	velocity = direction * speed * delta
	move_and_slide()
	if get_slide_collision_count() >= 1:
		var collision = get_slide_collision(0)
		if collision != null:
			print("collision")
			if bounce > 0:
				velocity = velocity.bounce(collision.get_normal())
			else:
				queue_free()
