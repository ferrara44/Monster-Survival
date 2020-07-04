extends KinematicBody2D

export (int) var speed = 250

var velocity = Vector2()
var running = false

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		running = true
		$AnimatedSprite.flip_h = false
		$weapon/Sword.flip_h = false
		$weapon/Sword.position.x = -5
		velocity.x += 1
	if Input.is_action_pressed('left'):
		running = true
		$AnimatedSprite.flip_h = true
		$weapon/Sword.flip_h = true
		$weapon/Sword.position.x = 5
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		running = true
		velocity.y += 1
	if Input.is_action_pressed('up'):
		running = true
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	
func animate():
	if running:
		$AnimatedSprite.play('run')
	else:
		$AnimatedSprite.play('idle')

func _process(_delta):
	get_input()
	animate()
	velocity = move_and_slide(velocity)
	running = false
