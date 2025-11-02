extends Node2D

const PARTICLES = preload("uid://43o4su6x3p56")

@onready var area: Area2D = %Area2D
@onready var energy: Energy = %Energy

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		energy.energy += 25.0
		var particles = PARTICLES.instantiate()
		add_sibling(particles)
		particles.position = position
		particles.emitting = true
		queue_free()
