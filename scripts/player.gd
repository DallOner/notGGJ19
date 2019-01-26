extends Area2D
export (int) var velocidad
var movimiento = Vector2()
var limite

func _ready():
	pass

func _move(delta):
	
	movimiento = Vector2()
	if Input.is_action_pressed("ui_right"):
		movimiento.x += 1
	if Input.is_action_pressed("ui_left"):
		movimiento.x -= 1
	
	if movimiento.length() > 0:
		movimiento = movimiento.normalized() * velocidad
	
	position += movimiento * delta

func _physics_process(delta):
	_move(delta)