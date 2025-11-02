extends Node2D

@onready var sprite: Sprite2D = $Sprite2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		(body as Player).spawn_position = position
		sprite.frame = 1
