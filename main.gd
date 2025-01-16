extends Node

@export var PigInstance: PackedScene
var midlePigY = 542
var lowPigY = 601
var highPigY = 491
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player.setLimits($Background/LeftLimit.global_position.x, $Background/RightLimit.global_position.x)
	var pigs = get_tree().get_nodes_in_group("Pigs")
	print(pigs)

func spavnPig():
	var groupSize = get_tree().get_nodes_in_group("Pigs").size()
	if groupSize > 7:
		return
	var newPig = PigInstance.instantiate()
	var pigX = randi_range($Background/LeftLimit.global_position.x + newPig.getPathRange(), $Background/RightLimit.global_position.x - newPig.getPathRange())
	var pigType = randi_range(1, 3)
	if pigType == 1:	
		newPig.position = Vector2(pigX, highPigY)
		newPig.setScale(0.5)
	elif pigType == 2:
		newPig.position = Vector2(pigX, midlePigY)
		newPig.setScale(0.7)
	else:
		newPig.position = Vector2(pigX, lowPigY)
	add_child(newPig)
	
