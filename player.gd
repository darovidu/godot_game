extends CharacterBody2D


const SPEED = 300.0

@onready var Bullet = preload("res://bullet.tscn")
@onready var Ui = preload("res://ui.tscn")
@onready var gun = $Gun
@onready var marker = $Gun/Marker2D
@onready var sprite: Sprite2D = $Sprite2D

var direction = Vector2.ZERO
var cooldown = true


func _physics_process(delta: float) -> void:
	get_input()
	if Input.is_action_just_pressed("shoot") and Global.bullets > 0 and cooldown == false:
		shoot()
	print(direction.x)
	#if direction.x == 1:
		#sprite.flip_h = 0
	#else:
		#sprite.flip_h = 1
	move_and_slide()
	var mousePosition = get_global_mouse_position()
	var direction_mouse = gun.global_position.direction_to(mousePosition)
	var angle_mouse = direction_mouse.angle()
	gun.rotation = angle_mouse
	if angle_mouse > PI/2 or angle_mouse < -PI/2:
		gun.scale.y = -1.0
	else:
		gun.scale.y = 1.0

func get_input():
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	velocity = direction * SPEED

func shoot():
	var bullet = Bullet.instantiate()
	bullet.position = marker.global_position
	var mousePosition = get_global_mouse_position()
	var direction_mouse = gun.global_position.direction_to(mousePosition)
	bullet.direction = direction_mouse
	bullet.rotation = direction_mouse.angle()
	bullet.bounce = 5
	get_tree().root.add_child(bullet)
	Global.bullets -= 1
	cooldown = true
	$Timer.start()


func _on_timer_timeout() -> void:
	cooldown = false
