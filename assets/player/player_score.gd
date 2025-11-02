extends Node

var score1: float
var score2: float

func get_winner():
	if score1 > score2:
		return "Player1"
	elif score2 > score1:
		return "Player2"
	else: return "No one"

func get_best_score():
	return max(score1, score2)

var has_gone_one: bool = false
func set_score(score):
	if !has_gone_one:
		score1 = score
		has_gone_one = true
	else: score2 = score

func restart():
	has_gone_one = false
	score1 = 0
	score2 = 0
