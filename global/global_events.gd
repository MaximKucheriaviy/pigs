extends Node

signal pigHitEvent

func pigHitEmit():
	pigHitEvent.emit()
