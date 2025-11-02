class_name Energy extends Control

@onready var progress_bar: ProgressBar = $ProgressBar
@onready var trap_manager: TrapManager = $"../../TrapManager"

signal on_energy_change(value: float)

var energy := 50.0:
	get: return energy
	set(value):
		energy = value
		if energy > 100.0: energy = 100.0
		if energy < 0.0: energy = 0.0
		emit_signal("on_energy_change", value)
		
@onready var run_timer: Timer = %RunTimer
func _process(delta: float) -> void:
	if run_timer.is_stopped(): return
	if !trap_manager.is_any_trap_on(): energy += delta

func _ready() -> void:
	on_energy_change.connect(_on_energy_change)
	
func _on_energy_change(value: float):
	progress_bar.value = value
