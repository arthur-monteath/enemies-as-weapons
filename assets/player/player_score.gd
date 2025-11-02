extends Node

var score1: float
var score2: float

func get_winner():
	if score1 > score2:
		return "Player1"
	elif score2 > score1:
		return "Player2"
	else: return "No one"

func dget_best_score():
	return max(score1, score2)
