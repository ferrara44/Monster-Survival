extends Node

var enemyscene = load("res://Mob.tscn")
var rand = RandomNumberGenerator.new()
var screensize
	
func _ready():
	randomize();
	screensize = get_viewport().get_visible_rect().size
	var _timer = null
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(1)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
		
func _on_Timer_timeout():
	var enemy = enemyscene.instance()
	var side = rand.randi_range(1,4)
	print (side)
	match side:
		1: 
			var x = screensize.x
			var y = rand.randf_range(0, screensize.y)
			enemy.position.x = x
			enemy.position.y = y
			add_child(enemy)
		2:
			var x = 0
			var y = rand.randf_range(0, screensize.y)
			enemy.position.x = x
			enemy.position.y = y
			add_child(enemy)
		3:
			var x = rand.randf_range(0, screensize.x)
			var y = screensize.y
			enemy.position.x = x
			enemy.position.y = y
			add_child(enemy)
		4:
			var x = rand.randf_range(0, screensize.x)
			var y = 0
			enemy.position.x = x
			enemy.position.y = y
			add_child(enemy)
