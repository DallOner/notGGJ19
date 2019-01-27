extends Node

const platforms = preload("res://scenes/plataformaSPAWN.tscn")
var screen = OS.get_real_window_size()
var numPlatforms

func _ready():
	randomize()
	for i in range(rand_range(4,10)):
		var plataforma = platforms.instance()
		var pos = Vector2()
		pos.x = rand_range(0,screen.x+1)
		pos.y = rand_range(0,screen.y+1)
		plataforma.position = pos
		$platformsContainer.add_child(plataforma)	
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
