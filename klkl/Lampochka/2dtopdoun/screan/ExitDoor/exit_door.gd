extends Node2D
@export var next_scene : String 

func _ready() -> void:
	position = get_parent().find_child("arr").get_child(randi_range(0, get_parent().find_child("arr").get_child_count() - 1)).position

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://screan/Level/leavl2.tscn")
		
