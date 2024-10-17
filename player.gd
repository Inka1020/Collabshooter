extends CharacterBody2D

var movespeed = 150

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("left"):
		velocity.x = -movespeed
	elif Input.is_action_pressed("right"):
		velocity.x = movespeed
	else:
		velocity.x = 0
	if Input.is_action_pressed("up"):
		velocity.y = -movespeed
	elif Input.is_action_pressed("down"):
		velocity.y = movespeed
	else:
		velocity.y = 0
	move_and_slide()
