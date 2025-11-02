extends Control

@onready var title_animation_player: AnimationPlayer = %TitleAnimationPlayer

func _ready() -> void:
	title_animation_player.play("titlebounce")


func _on_new_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")


func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/ui/credits.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()
