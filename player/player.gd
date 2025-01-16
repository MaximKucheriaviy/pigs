extends Node
@export var bombInstance: PackedScene
var bomb = null
var bombAttached = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bombSpawn()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		$Camera2D.position.x = lerp($Camera2D.position.x, $Copter/RightMarker.global_position.x, 0.07)
	elif Input.is_action_pressed("ui_left"):
		$Camera2D.position.x = lerp($Camera2D.position.x, $Copter/LeftMarker.global_position.x, 0.07)
	else:
		$Camera2D.position.x = lerp($Camera2D.position.x, $Copter.global_position.x, 0.07)
	
	if Input.is_action_pressed("LaunchBomb"):
		bombAttached = false
		bomb.freeze = false

func bombSpawn():
	bomb = bombInstance.instantiate()
	bombAttached = true
	bomb.respawn.connect(onBombRespavn)
	bomb.position = $Copter/BombAttach.position
	bomb.setParrent($Copter)

func onBombRespavn():
	bombSpawn()

func lounchBomb():
	bomb.setParrent(self)
	bombAttached = false
	bomb.freeze = false
	bomb = null

func setLimits(leftLimit: int, rightLimit: int):
	$Copter.leftLimit = leftLimit
	$Copter.rightLimit = rightLimit
	$Camera2D.limit_left = leftLimit
	$Camera2D.limit_right = rightLimit
