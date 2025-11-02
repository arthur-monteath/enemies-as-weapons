extends Camera2D

@onready var player: Player = %Player

func _process(delta: float) -> void:
	position = player.position
