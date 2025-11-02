class_name Trap extends Node2D

@onready var player: Player = %Player

@export var type: TrapManager.TrapType
signal on_trap_state_changed(state: bool)

func _ready() -> void:
	process_priority = 1
	on_trap_state_changed.connect(_on_trap_state_changed)

func _on_trap_state_changed(value: bool):
	get_child(0).visible = value

func toggle_trap(state = !trap_state):
	trap_state = state

var trap_state: bool = false:
	get: return trap_state
	set(value):
		if trap_state != value: emit_signal("on_trap_state_changed", value)
		trap_state = value
