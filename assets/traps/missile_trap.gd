extends Trap

var missile_ready: bool = true
func _physics_process(delta: float) -> void:
	if trap_state and missile_ready:
		spawn_missile()
		missile_ready = false
		get_tree().create_timer(1).timeout.connect(func(): missile_ready = true)
		
const MISSILE = preload("uid://mjw5bbox0k74")

func spawn_missile():
	var missile: Node2D = MISSILE.instantiate()
	missile.look_at(get_direction()* 10)
	missile.set_direction(get_direction())
	missile.position = get_direction().normalized()*16
	add_child(missile)
