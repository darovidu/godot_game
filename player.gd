extends CharacterBody2D


const SPEED = 300.0

var direction = Vector2.ZERO


func _physics_process(delta: float) -> void:
	get_input()
	print(direction.x)
	if direction.x < 0:
		scale.x = -1
	if direction.x > 0:
		scale.x = 1
	move_and_slide()

func get_input():
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	velocity = direction * SPEED
