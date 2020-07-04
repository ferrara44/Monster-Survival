extends Node2D

var angle = 0

func get_input():
	if Input.is_action_pressed("left"):
		angle=70
	if Input.is_action_pressed("right"):
		angle=-70

func _process(_delta):
	get_input()
	$Sword.rotation = angle
