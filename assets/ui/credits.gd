extends Control

@onready var credit_animation_player: AnimationPlayer = %CreditTextAnimation

func _ready() -> void:
	credit_animation_player.play("credit_animation")
	leave_credits()
	
func leave_credits():
	await get_tree().create_timer(9.0).timeout
	get_tree().change_scene_to_file("res://assets/ui/menu.tscn")
