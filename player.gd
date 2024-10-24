extends CharacterBody2D

var movespeed = 300
var lives = 5
var dir = 1#1 is left, 2 is right, 3 is up, 4 is down (sry if its a bit confusing)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("left"):
		velocity.x = -movespeed
		$Sprite2D.flip_h = false #flips/unflips sprite
		dir = 1 #sets direction for the bullets
	elif Input.is_action_pressed("right"):
		velocity.x = movespeed
		$Sprite2D.flip_h = true
		dir = 2
	else:
		velocity.x = 0#if not left or right, dont go left or right
	if Input.is_action_pressed("up"):
		velocity.y = -movespeed
		dir = 3
	elif Input.is_action_pressed("down"):
		velocity.y = movespeed
		dir = 4
	else:
		velocity.y = 0
	move_and_slide()
