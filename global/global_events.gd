extends Node

signal pigHitEvent
var pigMoving = false

func pigHitEmit():
	pigMoving = true
	pigHitEvent.emit()
	
func isPigMoving():
	return pigMoving
