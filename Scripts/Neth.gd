extends KinematicBody2D

const MAX_SPEED = 50

var velocity = Vector2.ZERO

onready var animationplayer = $AnimationPlayer
onready var animationtree = $AnimationTree
onready var animationstate = animationtree.get('parameters/playback')

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up") 
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animationtree.set("parameters/Idle/blend_position", input_vector)
		animationtree.set("parameters/Walk/blend_position", input_vector)
		animationstate.travel("Walk")
		velocity = input_vector * MAX_SPEED
	else:
		animationstate.travel("Idle")
		velocity = Vector2.ZERO
	 
	velocity = move_and_slide(velocity)
