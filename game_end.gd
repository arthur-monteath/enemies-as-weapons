extends Control

@onready var player_label: Label = $VBoxContainer/Player
@onready var score_1: Label = $VBoxContainer/Score1
@onready var score_2: Label = $VBoxContainer/Score2

func _ready() -> void:
	player_label.text = PlayerScore.get_winner() + " won!"
	
	score_1.text = "Player1 scored " + str(int(PlayerScore.score1))
	score_2.text = "Player2 scored " + str(int(PlayerScore.score2))
