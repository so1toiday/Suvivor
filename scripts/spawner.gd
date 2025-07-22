extends Node2D

@onready var l_minute=$UI/HBoxContainer/minute
@onready var l_second=$UI/HBoxContainer/second
@export var enemy:PackedScene
@export var player:CharacterBody2D
var distance:float=400
@export var Enemy_types:Array[Enemy]
var minute:int:
	set(value):
		minute=value
		l_minute.text=str(value)

var second:int:
	set(value):
		second=value
		if second>=10:
			minute+=1
			second=0
		l_second.text=str(second).lpad(2,'0')

func spawn(pos:Vector2):
	var enemy_instance=enemy.instantiate()
	enemy_instance.global_position=pos
	enemy_instance.player_ref=player
	enemy_instance.type=Enemy_types[randi_range(0,1)]
	get_tree().current_scene.add_child(enemy_instance)
	
func get_random_position() -> Vector2:
	return player.position +distance*Vector2.RIGHT.rotated(randf_range(0,2*PI))

func amount(number:int=1):
	for i in range(number):
		spawn(get_random_position())
		
func _on_timer_timeout() -> void:
	second+=1
	amount(second%5)
