@tool
extends Sprite2D

func _process(delta: float) -> void:
	var trap := get_parent() as Trap
	match trap.type:
		TrapManager.TrapType.TRAP_LEFT: rotation_degrees = 180.0
		TrapManager.TrapType.TRAP_RIGHT: rotation_degrees = 0.0
		TrapManager.TrapType.TRAP_UP: rotation_degrees = 270.0
		TrapManager.TrapType.TRAP_DOWN: rotation_degrees = 90.0

func set_state(state: bool):
	frame = int(state)
