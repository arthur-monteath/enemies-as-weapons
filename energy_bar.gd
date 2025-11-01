extends Control

@onready var progress_bar: ProgressBar = $ProgressBar

signal on_energy_change(value: float)

var energy := 50.0:
	get: return energy
	set(value):
		energy = value
		emit_signal("on_energy_change", value)

func _process(delta: float) -> void:
	energy += delta

func _ready() -> void:
	on_energy_change.connect(_on_energy_change)
	
func _on_energy_change(value: float):
	progress_bar.value = value
