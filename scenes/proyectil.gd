extends RigidBody2D

export (int) var speed = 50
var movement = Vector2()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	movement.x += 2 * speed
	position = movement


func _on_Timer_timeout():
	$CollisionShape2D.disabled = false
	print($CollisionShape2D.disabled)
