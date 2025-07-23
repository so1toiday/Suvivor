extends CharacterBody2D
var speed=150
var healthy=100

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down")*speed
	move_and_collide(velocity*delta)

func take_damage(amount:int):
	healthy-=amount
	print(str(healthy))
	print(str(amount))
	
	

func _on_self_damage_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		take_damage(body.type.damage)
	
	
	
	
	
	
	
	
	
	
