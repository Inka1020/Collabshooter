extends Node2D

var collectable = preload("res://collectable.tscn")
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
			var newcollectable = collectable.instantiate()
			add_child(newcollectable)
			newcollectable.global_position = playerpos #sends collectable to players global position
