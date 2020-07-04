extends KinematicBody2D

var mob_types = ["skeleton", "muddy", "chomper"]

func _ready():
	 $AnimatedSprite.animation = mob_types[randi() % mob_types.size()]

func _on_Visibility_screen_exited():
	queue_free()
