extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if($sprite.frame < 8):
				if $sprite.frame == 7:
					$sprite.frame = 0
				else:
					$sprite.frame += 1	
