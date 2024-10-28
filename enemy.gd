extends Area2D

var yspeed = 0
var xspeed = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x = position.x + xspeed
	position.y = position.y + yspeed


func _on_timer_timeout() -> void:
	var playery = get_parent().get_parent().get_node("player").global_position.y
	var playerx = get_parent().get_parent().get_node("player").global_position.x
	
	if global_position.y < playery:
		yspeed = 2
	elif global_position.y > playery:
		yspeed = -2
	else:
		yspeed = 1

	if global_position.x > playerx:
		xspeed = -4
	elif global_position.x < playerx:
		xspeed = 4
	else:
		xspeed = 1


func _on_area_entered(area: Area2D) -> void:
	get_parent().get_parent().get_node("scoreboard").score += 1
	get_parent().enemies -= 1
	queue_free()
