extends Node2D

var bullet = preload("res://bullet.tscn")
var dir = 0
var pause = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var playerpos = get_parent().get_node("player").global_position#gets players position (global means position on screen)
	dir = get_parent().get_node("player").dir
	
	if Input.is_action_just_pressed("pause"):
		if pause == 0:
			pause = 1
		else:
			pause = 0
	
	if Input.is_action_just_pressed("shoot"): #shoot is right click
		if pause == 0:
			var newbullet = bullet.instantiate()
			add_child(newbullet)
			newbullet.global_position = playerpos #sends bullet to players global position
