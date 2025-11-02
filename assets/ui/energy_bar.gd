class_name Energy extends Control

@onready var progress_bar: ProgressBar = $ProgressBar
@onready var trap_manager: TrapManager = $"../../TrapManager"

signal on_energy_change(value: float)

var energy := 50.0:
	get: return energy
	set(value):
		energy = value
		emit_signal("on_energy_change", value)

func _process(delta: float) -> void:
	if !trap_manager.is_any_trap_on(): energy += delta

func _ready() -> void:
	on_energy_change.connect(_on_energy_change)
	
func _on_energy_change(value: float):
	progress_bar.value = value
