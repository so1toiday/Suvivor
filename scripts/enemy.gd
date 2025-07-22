extends CharacterBody2D

@export var player_ref:CharacterBody2D
@export var speed =75
@onready var anim=$AnimatedSprite2D

func _physics_process(delta: float) -> void:
	velocity=global_position.direction_to(player_ref.global_position) * speed
	move_and_collide(velocity*delta)

var type:Enemy:
	set(value):
		type=value
		anim.sprite_frames=value.frames
		anim.play("walk")
		
		
		
		
		
		
