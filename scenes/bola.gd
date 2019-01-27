extends Sprite

export (int) var speed = 5
var movement = Vector2()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	movement.x -= 2 * speed
	position = movement


func _on_Timer_timeout():
	pass
	#$CollisionShape2D.disabled = false
	#print($CollisionShape2D.disabled)


func _on_Area2D_body_entered(body):
	#print("hola")
	pass
	
