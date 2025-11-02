extends Trap
@onready var area: Area2D = $Fan/Area2D

@onready var ray: RayCast2D = $Fan/RayCast2D

@export var speed = 1000.0

func _physics_process(delta: float) -> void:
	if trap_state and area.overlaps_body(player):
		var vel_effect := transform.basis_xform(Vector2.RIGHT * speed)
		player.modify_velocity(vel_effect)
