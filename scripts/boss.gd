extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
#const idle = preload("res://sprites/boss-ldle.png")
var vida
signal golpe 
func _ready():
	$elpoder.play()
	vida = 50
	$AnimatedSprite.animation = "idle"

func _process(delta):
	pass


func _on_boss_body_entered(body):
	print("en boss")



func _on_boss_area_shape_entered(area_id, area, area_shape, self_shape):
	#print("dsdasd")
	vida -= 1
	var newPosition = Vector2(position.x+1,position.y)
	position = newPosition


func _on_timerPoder_timeout():
	$elpoder.play()