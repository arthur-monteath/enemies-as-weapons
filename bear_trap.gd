extends Trap

@onready var area: Area2D = $Area2D

func _on_trap_state_changed(value: bool):
	if value:
		var tw := get_tree().create_tween()
		tw.tween_property(get_node("Sprite2D"), "frame", 4, 0.1)
		tw.tween_callback(kill_player)
	else:
		var tw := get_tree().create_tween()
		tw.tween_property(get_node("Sprite2D"), "frame", 0, 0.1)

func kill_player():
	if area.overlaps_body(player):
		player.die()
