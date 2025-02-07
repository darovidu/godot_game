extends CharacterBody2D


var direction
var speed = 500
var bounce
var spawnRot
var spawnPos
var zdex


func _ready() -> void:
	global_position = spawnPos
	global_rotation = spawnRot
	z_index = zdex

func _physics_process(delta: float) -> void:
	velocity = Vector2(0, -speed).rotated(direction)
	move_and_slide()
	if get_slide_collision_count() >= 1:
		var collision = get_slide_collision(0)
		if collision != null:
			velocity = velocity.bounce(collision.get_normal())


#func _on_body_entered(body: Node2D) -> void:
	#if bounce > 0:
		#direction *= -1
		#bounce -= 1
	#else:
		#queue_free()
