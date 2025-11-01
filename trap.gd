class_name Trap extends Node2D

@export var type: TrapManager.TrapType

func _ready() -> void:
	process_priority = 1

func toggle_trap(state = !trap_state):
	trap_state = state

var trap_state: bool = false:
	get: return trap_state
	set(value):
		trap_state = value
		get_child(0).visible = value
