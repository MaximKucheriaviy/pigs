extends Area2D

var camerSpeed = 400

var rotation_speed = 3.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("fly")

func _process(delta: float) -> void:

		
	if Input.is_action_pressed("ui_right"):
		position.x += camerSpeed * delta
		rotation = lerp_angle(rotation, 0.25, rotation_speed * delta)
	elif Input.is_action_pressed("ui_left"):
		position.x -= camerSpeed * delta
		rotation = lerp_angle(rotation, -0.25, rotation_speed * delta)
	else:
		rotation = lerp_angle(rotation, 0, rotation_speed * delta)
		
