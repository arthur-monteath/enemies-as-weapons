extends Control

@onready var title_animation_player: AnimationPlayer = %TitleAnimationPlayer

func _ready() -> void:
	title_animation_player.play("titlebounce")

func _credits() -> void:
	pass
	
	
