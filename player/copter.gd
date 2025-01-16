extends Area2D

var camerSpeed = 400

@export var rotation_speed = 3.0
@export var leftLimit = -100
@export var rightLimit = 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("fly")

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_right") and position.x < rightLimit:
		position.x += camerSpeed * delta
		$AnimatedSprite2D.rotation = lerp_angle($AnimatedSprite2D.rotation, 0.25, rotation_speed * delta)
	elif Input.is_action_pressed("ui_left") and position.x > leftLimit:
		position.x -= camerSpeed * delta
		$AnimatedSprite2D.rotation = lerp_angle($AnimatedSprite2D.rotation, -0.25, rotation_speed * delta)
	else:
		$AnimatedSprite2D.rotation = lerp_angle($AnimatedSprite2D.rotation, 0, rotation_speed * delta)
		
