extends CharacterBody2D

var max_speed = 200

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasLayer/Label.text = "*" + str(round($Timer.time_left))
	var direction = movement_vector().normalized()
	velocity = max_speed * direction
	move_and_slide()
	
func movement_vector():
	var movement_x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var movement_y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(movement_x,movement_y)

func _on_timer_timeout():
	get_tree().reload_current_scene()
