extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation: AnimationPlayer = $AnimationPlayer

const SPEED = 60.0
const JUMP_VELOCITY = -80.0

const GRAVITY = 0.5
const MAX_JUMP_TIME = 0.4
var jump_length := 0.0

func _physics_process(delta: float) -> void:
	var is_jumping = Input.is_action_pressed("jump") and jump_length <= MAX_JUMP_TIME
	if !is_jumping and is_on_floor(): jump_length = 0.0
	else: jump_length += delta

	if not is_on_floor() and !is_jumping:
		velocity += get_gravity() * delta * GRAVITY

	if Input.is_action_just_pressed("jump") and is_on_floor():
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

	move_and_slide()
