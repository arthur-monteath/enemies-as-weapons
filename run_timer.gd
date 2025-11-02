extends Timer

@onready var label: Label = $"../CanvasLayer/MarginContainer/Label"

func _unhandled_input(event: InputEvent) -> void:
	if event.is_pressed():
		if is_stopped(): start(180)

func _process(_delta: float) -> void:
	if is_stopped(): return
	var minutes = int(time_left/60)
	if int(time_left)%60<10: 
		label.text = str(minutes, ":0", int(time_left)%60)
	else: label.text = str(minutes, ":", int(time_left)%60)
