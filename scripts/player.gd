extends KinematicBody2D

export (PackedScene) var proyectil
const up = Vector2(0,-1)
const gravity = 20
const jumpHeight = -700
const speed = 5
var limite
var motion = Vector2()
var contProyectil = 0

func _ready():
	limite = get_viewport_rect().size


func _physics_process(delta):
	motion.y += gravity
	
	if Input.is_key_pressed(KEY_D):
		$pistola.right = true
		motion.x += speed
	if Input.is_key_pressed(KEY_A):
		$pistola.right = false
		motion.x -= speed	 
	if Input.is_key_pressed(KEY_C):
		if contProyectil < 1:
			contProyectil += 1
			var houdoken = proyectil.instance()
			#houdoken.position = position
			var houdokenPosition = Vector2()
			houdokenPosition.x = position.x - 1
			houdokenPosition.y = position.y
			houdoken.position = houdokenPosition
			$pistola.add_child(houdoken)
			if($pistola.right == false):
				houdoken.speed = houdoken.speed * -1	
	else:
		motion.x += 0
	if is_on_floor():
		if Input.is_key_pressed(KEY_W):
			motion.y = jumpHeight
			contProyectil = 0
	
	motion = move_and_slide(motion,up)
	#position.x = clamp(position.x, 0, limite.x)
	#position.y = clamp(position.y, 0, limite.y)
