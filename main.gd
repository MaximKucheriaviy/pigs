extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player.setLimits($Background/LeftLimit.global_position.x, $Background/RightLimit.global_position.x)
