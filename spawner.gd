extends Node2D

var collectable = preload("res://collectable.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var playerpos = get_parent().get_node("player").global_position
	if Input.is_action_just_pressed("shoot"):
		var newcollectable = collectable.instantiate()
		add_child(newcollectable)
		newcollectable.global_position = playerpos
