extends Node2D

const SPEED := 1.8

@onready var area: Area2D = $Area2D
@onready var explosion: Area2D = %Explosion

var velocity: Vector2 = Vector2.DOWN * 2.0
func _physics_process(delta: float) -> void:
	velocity += Vector2.DOWN * SPEED * delta
	position += velocity

const PARTICLES = preload("uid://43o4su6x3p56")

@onready var explode_particles := $GPUParticles2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	var particles = PARTICLES.instantiate()
	add_sibling(particles)
	particles.position = position
	explode_particles.emitting = true
	explode_particles.reparent(get_parent())
	if body.is_in_group("player"): (body as Player).die()
	else:
		for explode_body in explosion.get_overlapping_bodies():
			if explode_body.is_in_group("player"): (explode_body as Player).die()
	get_tree().create_timer(1.2).timeout.connect(explode_particles.queue_free)
	queue_free()
