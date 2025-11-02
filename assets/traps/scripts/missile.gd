extends Node2D

const SPEED := 200.0

@onready var area: Area2D = $Area2D
@onready var trail := $GPUParticles2D
func _ready():
	trail.emitting = true

var direction: Vector2
func set_direction(vector: Vector2):
	direction = vector

func _physics_process(delta: float) -> void:
	position += direction * SPEED * delta

const PARTICLES = preload("uid://43o4su6x3p56")

func _on_area_2d_body_entered(body: Node2D) -> void:
	var particles = PARTICLES.instantiate()
	add_sibling(particles)
	trail.emitting = false
	trail.reparent(get_parent())
	particles.position = position
	particles.emitting = true
	if body.is_in_group("player"): (body as Player).die()
	get_tree().create_timer(1.2).timeout.connect(trail.queue_free)
	queue_free()
