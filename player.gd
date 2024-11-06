extends CharacterBody2D

var movespeed = 300
var spawnpos = 0
var lives = 5
var pause = 1
var dir = 1#1 is left, 2 is right, 3 is up, 4 is down (sry if its a bit confusing)

# Called when the node enters the scene tree for the first time.
func _ready():
	spawnpos = global_position
	$AnimatedSprite2D.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		if pause == 0:
			pause = 1
			$AnimatedSprite2D.play("idle")
			print("paused")
		elif pause == 1:
			pause = 0
			print("unpaused")
		
	if lives == 0:
		print(lives, "is zero")
		if pause > -1:
			pause = -2
			Input.action_press("pause")
			$AnimatedSprite2D.play("dead")
		#get_tree().reload_current_scene()
			
	if pause == 0:
		if Input.is_action_pressed("left"):
			velocity.x = -movespeed
			$AnimatedSprite2D.flip_h = true #flips/unflips sprite
			$AnimatedSprite2D.play("run")
			dir = 1 #sets direction for the bullets
		elif Input.is_action_pressed("right"):
			velocity.x = movespeed
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("run")
			dir = 2
		else:
			velocity.x = 0#if not left or right, dont go left or right
		if Input.is_action_pressed("up"):
			velocity.y = -movespeed
			dir = 3
			$AnimatedSprite2D.play("run")
		elif Input.is_action_pressed("down"):
			velocity.y = movespeed
			dir = 4
			$AnimatedSprite2D.play("run")
		else:
			velocity.y = 0
		if velocity.y == 0 and velocity.x == 0:
			$AnimatedSprite2D.play("idle")
		move_and_slide()


func _on_area_entered(area: Area2D) -> void:
	lives = lives - 1
	global_position = spawnpos
	print("lives", lives)
