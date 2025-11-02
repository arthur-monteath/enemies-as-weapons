extends Control

@onready var player_label: Label = %PlayerLabel
@onready var score_1: Label = %Score1
@onready var score_2: Label = %Score2

func _ready() -> void:
	player_label.text = PlayerScore.get_winner() + " wins!"
	
	score_1.text = "Player1 scored " + str(int(PlayerScore.score1))
	score_2.text = "Player2 scored " + str(int(PlayerScore.score2))


func _on_button_pressed() -> void:
	PlayerScore.restart()
	get_tree().change_scene_to_file("res://assets/ui/menu.tscn")
