extends CharacterBody2D
var speed=150


func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down")*speed
	move_and_collide(velocity*delta)
