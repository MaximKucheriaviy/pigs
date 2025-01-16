extends RigidBody2D

signal respawn


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	$RespawnTimer.start()
	

func _on_respawn_timer_timeout() -> void:
	respawn.emit()
	queue_free()

func setParrent(parreent:Node):
	if get_parent():
		get_parent().remove_child(self)
		
	parreent.add_child(self)
