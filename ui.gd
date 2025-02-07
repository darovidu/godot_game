extends CanvasLayer


func _physics_process(delta: float) -> void:
	$Label.text = str(Global.bullets)
