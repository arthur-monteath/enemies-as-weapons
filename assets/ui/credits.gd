extends Control

@onready var credit_animation_player: AnimationPlayer = %CreditTextAnimation

func _ready() -> void:
	credit_animation_player.play("credit_animation")
	
