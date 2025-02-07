extends Node2D


@onready var Bullet = preload("res://bullet.tscn")

var true_shoot = true
var bullets = 5


func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -1
	else:
		scale.y = 1
	if Input.is_action_just_pressed("shoot") and true_shoot == true and bullets > 0:
		shoot()

func shoot():
	var bullet = Bullet.instantiate()
	bullet.spawnPos = $Marker2D.global_position
	bullet.direction = rotation
	bullet.spawnRot = rotation
	bullet.bounce = 5
	get_tree().root.add_child(bullet)
	bullets -= 1
	true_shoot = false
	$Timer.start()

func _on_timer_timeout() -> void:
	true_shoot = true
