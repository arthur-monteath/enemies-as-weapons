extends Timer

@onready var label: Label = $"../CanvasLayer/MarginContainer/Label"

func _ready() -> void:
	start(120)

func _process(_delta: float) -> void:
	var minutes = int(time_left/60)
	label.text = str(minutes, ":", int(time_left)%60)
