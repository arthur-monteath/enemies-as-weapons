extends Node2D

@onready var run_timer: Timer = %RunTimer

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if PlayerScore.has_gone_one:
			PlayerScore.set_score(run_timer.time_left)
			get_tree().change_scene_to_file("res://game_end.tscn")
		else:
			PlayerScore.set_score(run_timer.time_left)
			get_tree().change_scene_to_file("res://intermission.tscn")


func _on_run_timer_timeout() -> void:
	if PlayerScore.has_gone_one:
		PlayerScore.set_score(0.0)
		get_tree().change_scene_to_file("res://game_end.tscn")
	else:
		PlayerScore.set_score(0.0)
		get_tree().change_scene_to_file("res://intermission.tscn")
