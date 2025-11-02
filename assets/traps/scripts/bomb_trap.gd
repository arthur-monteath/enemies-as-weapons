extends Trap

var bomb_ready: bool = true
func _physics_process(delta: float) -> void:
	if trap_state and bomb_ready:
		spawn_bomb()
		bomb_ready = false
		get_tree().create_timer(1).timeout.connect(func(): bomb_ready = true)

const BOMB = preload("uid://dnakkfdec8js0")

func spawn_bomb():
	var bomb: Node2D = BOMB.instantiate()
	bomb.position = get_direction().normalized()*16
	add_child(bomb)
