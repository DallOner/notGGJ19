extends KinematicBody2D

const up = Vector2(0,-1)
const gravity = 20
const jumpHeight = -500
const speed = 5

var motion = Vector2()

func _physics_process(delta):
	motion.y += gravity
	
	if Input.is_action_pressed("ui_right"):
		motion.x += speed
	if Input.is_action_pressed("ui_left"):
		motion.x -= speed	 
	else:
		motion.x += 0
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = jumpHeight
	
	motion = move_and_slide(motion,up)
