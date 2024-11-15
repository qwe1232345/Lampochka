extends CharacterBody2D

var max_speed = 170
var count = 2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and count > 0:
		max_speed = 0
		count -= 1
		await get_tree().create_timer(1.5).timeout
		max_speed = 170
	
	var direction = get_direction_to_player()
	velocity = max_speed * direction
	move_and_slide()

func get_direction_to_player():
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player != null:
		return (player.global_position - global_position).normalized()
	return Vector2(0,0)


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()
