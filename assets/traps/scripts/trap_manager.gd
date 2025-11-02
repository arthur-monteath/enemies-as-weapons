class_name TrapManager extends Node2D

@onready var energy: Energy = %Energy

const SPAWN_POSITION := Vector2(0, -9)

enum TrapType {
	TRAP_LEFT,
	TRAP_RIGHT,
	TRAP_UP,
	TRAP_DOWN
}

var trap_states: Dictionary[TrapType, bool] = {
	TrapType.TRAP_LEFT: false,
	TrapType.TRAP_RIGHT: false,
	TrapType.TRAP_UP: false,
	TrapType.TRAP_DOWN: false,
}

func is_any_trap_on() -> bool:
	for state in trap_states.values():
		if state == true: return true
	return false

func _process(delta):
	if energy.energy <= 10.0:
		for trap: Trap in get_children():
			trap.toggle_trap(false)
		for state in trap_states.keys():
			trap_states[state] = false
		if energy.energy < 0.0: energy.energy = 0.0
		return
	for state in trap_states.values():
		if state: energy.energy -= delta

func _unhandled_input(event: InputEvent) -> void:
	if energy.energy <= 10.0: return
	if Input.is_action_just_pressed("trap_left"):
		trap_states[TrapType.TRAP_LEFT] = !trap_states[TrapType.TRAP_LEFT]
	if Input.is_action_just_pressed("trap_right"):
		trap_states[TrapType.TRAP_RIGHT] = !trap_states[TrapType.TRAP_RIGHT]
	if Input.is_action_just_pressed("trap_up"):
		trap_states[TrapType.TRAP_UP] = !trap_states[TrapType.TRAP_UP]
		if trap_states[TrapType.TRAP_UP]: energy.energy -= 5.0
	if Input.is_action_just_pressed("trap_down"):
		trap_states[TrapType.TRAP_DOWN] = !trap_states[TrapType.TRAP_DOWN]
	for trap: Trap in get_children():
		trap.toggle_trap(trap_states[trap.type])
