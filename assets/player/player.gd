class_name Player extends CharacterBody2D

@onready var jump_particles: GPUParticles2D = $GPUParticles2D
@onready var sprite: Sprite2D = $Sprite2D
@onready var animation: AnimationPlayer = $AnimationPlayer

const SPEED = 60.0
const JUMP_VELOCITY = -80.0

const GRAVITY = 0.5
const MAX_JUMP_TIME = 0.4
var jump_length := 0.0

func _ready() -> void:
	process_priority = 10

var spawn_position := Vector2(0, -9)

func die():
	velocity = Vector2.ZERO
	velocity_additive = Vector2.ZERO
	var sp := sprite.duplicate()
	sp.position = position
	sp.frame = 5
	get_tree().create_tween().tween_property(sp, "self_modulate:a", 0, 12)
	get_parent().add_child(sp)
	position = spawn_position

var velocity_additive: Vector2
func modify_velocity(vel: Vector2):
	velocity_additive += vel

var coyote_timer
var is_coyote_on_floor: bool
func calculate_coyote_is_on_floor():
	if is_on_floor():
		is_coyote_on_floor = true
		coyote_timer = null
	elif coyote_timer == null:
		coyote_timer = get_tree().create_timer(0.15)
		coyote_timer.timeout.connect(func(): is_coyote_on_floor = false)

func _physics_process(delta: float) -> void:
	var is_jumping = Input.is_action_pressed("jump") and jump_length <= MAX_JUMP_TIME
	if not is_jumping: calculate_coyote_is_on_floor()
	if !is_jumping and is_coyote_on_floor: jump_length = 0.0
	else: jump_length += delta

	if not is_on_floor() and !is_jumping:
		velocity += get_gravity() * delta * GRAVITY
		jump_particles.emitting = false

	if Input.is_action_just_pressed("jump") and is_coyote_on_floor:
		jump_particles.restart()
		jump_particles.emitting = true
		velocity.y = JUMP_VELOCITY
		
	if !is_on_floor(): animation.play("jump")

	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		sprite.flip_h = direction < 0
		if is_on_floor(): animation.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor(): animation.play("RESET")

	velocity += velocity_additive
	move_and_slide()
	velocity_additive = Vector2.ZERO
	if is_jumping: is_coyote_on_floor = false
