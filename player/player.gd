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
	$Camera2D.position.x = lerp($Camera2D.position.x, $Copter.position.x, 0.07)
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
