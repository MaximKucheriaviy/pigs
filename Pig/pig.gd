extends Node2D

@export var speed = 100
@export var isMove = false



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var r = (randi() % 10) / 10.0
	isMove = GlobalEvents.isPigMoving()
	$Path2D/PathFollow2D.progress_ratio = r
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move(delta)

func move(delta: float):
	if $Path2D/PathFollow2D.progress_ratio > 0.5:
		$Path2D/PathFollow2D/Area2D/Pig.flip_h = true
	else:
		$Path2D/PathFollow2D/Area2D/Pig.flip_h = false
	pass
	if not isMove:
		return
	$Path2D/PathFollow2D.progress += speed * delta
	

func setScale(scaleParam: float):
	$Path2D/PathFollow2D/Area2D/Pig.scale = Vector2(scaleParam, scaleParam)
	$Path2D/PathFollow2D/Area2D/CollisionShape2D.scale = Vector2(scaleParam, scaleParam)


func _on_area_2d_body_entered(body) -> void:
	GlobalEvents.pigHitEmit()
	get_tree().call_group("Pigs", 'setMove')
	$Path2D/PathFollow2D/Area2D/Pig.hide()
	$Path2D/PathFollow2D/Area2D/Explosition.emit()
	

func setMove():
	isMove = true
	
func getPathRange() -> float:
	return abs($RightBorder.position.x - $LeftBorder.position.x)


func _on_explosition_finished() -> void:
	queue_free()
