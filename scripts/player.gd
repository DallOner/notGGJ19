extends KinematicBody2D

const run = preload("res://sprites/player-one_run-Sheet.png")
const idle = preload("res://sprites/player-one_ldle.png")
const jump = preload("res://sprites/player-one_jump-Sheet.png")
const atack = preload("res://sprites/player-one_attack-Sheet.png")

export (PackedScene) var proyectil
const up = Vector2(0,-1)
const gravity = 20
const jumpHeight = -700
const speed = 5
var limite
var motion = Vector2()
var contProyectil = 0
var isJumping

func _ready():
	isJumping = false
	limite = get_viewport_rect().size


func _physics_process(delta):
	motion.y += gravity
	
	
	if Input.is_key_pressed(KEY_D):
		$sprites.flip_h = false
		if !isJumping:
			$sprites.texture = run
			$sprites.vframes = 1
			$sprites.hframes = 8
			if($sprites.frame < 8):
				if $sprites.frame == 7:
					$sprites.frame = 0
				else:
					$sprites.frame += 1
		$pistola.right = true
		motion.x += speed
	if Input.is_key_pressed(KEY_A):
		$sprites.flip_h = true
		if !isJumping:
			$sprites.vframes = 1
			$sprites.hframes = 8
			$sprites.texture = run	
			if($sprites.frame < 8):
				if $sprites.frame == 7:
					$sprites.frame = 0
				else:
					$sprites.frame += 1	
		$pistola.right = false
		motion.x -= speed	 
	if Input.is_key_pressed(KEY_C):
		if contProyectil < 1:
			#$AnimatedSprite.animation = "disparo"
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
		if !isJumping && motion.x == 0:
			$sprites.vframes = 1
			$sprites.hframes = 1
			$sprites.frame = 0
			$sprites.texture = idle
	if is_on_floor():
		isJumping = false
		if Input.is_key_pressed(KEY_W):
			isJumping = true
			$sprites.vframes = 1
			$sprites.hframes = 8
			$sprites.texture = jump
			if($sprites.frame < 8):
				if $sprites.frame == 7:
					$sprites.frame = 0
			else:
				$sprites.frame += 1
			motion.y = jumpHeight
			contProyectil = 0
	motion = move_and_slide(motion,up)
	#position.x = clamp(position.x, 0, limite.x)
	position.y = clamp(position.y, 0, limite.y)
