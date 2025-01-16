extends Node2D

@export var speed = 100
@export var isMove = true



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move(delta)

func move(delta: float):
	if not isMove:
		return
	$Path2D/PathFollow2D.progress += speed * delta
	if $Path2D/PathFollow2D.progress_ratio > 0.5:
		$Path2D/PathFollow2D/Area2D/Pig.flip_h = true
	else:
		$Path2D/PathFollow2D/Area2D/Pig.flip_h = false
	pass

func setScale(scale: float):
	$PathFollow2D/Pig.scale = Vector2(scale, scale)


func _on_area_2d_body_entered(body: Node2D) -> void:
	GlobalEvents.pigHitEmit()
	queue_free()
