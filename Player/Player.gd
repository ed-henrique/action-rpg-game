extends KinematicBody2D

# const FRICTION = 10
const ACC_GLOBAL = 500
const MAX_SPEED = 80

var velocity = Vector2.ZERO

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	velocity = velocity.move_toward(input_vector * MAX_SPEED, ACC_GLOBAL * delta)
	velocity = move_and_slide(velocity)
