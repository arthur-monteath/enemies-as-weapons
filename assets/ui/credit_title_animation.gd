extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play("title_credits_rise")
	#_on_credit_title_animation_animation_finished()
	
"""
func _on_credit_title_animation_animation_finished() -> void:
	print("done")
	play("credit_names_rise")
"""
