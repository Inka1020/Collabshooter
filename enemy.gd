extends Area2D

var yspeed = 0
var xspeed = 0
var lvlspeed = 0
var pause = 1 #0 for unpaused, 1 for paused

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lvlspeed = get_parent().score #modifies enemy speed based on score
	if lvlspeed == 0:
		lvlspeed = randi_range(-1, 0)#chooses a random amount to change the enemy's speed by
	elif lvlspeed <= 15:
		lvlspeed = randi_range(-1, 1)
	elif lvlspeed < 35:
		lvlspeed = randi_range(0, 2)
	elif lvlspeed < 50:
		lvlspeed = randi_range(0, 3)
	elif lvlspeed < 150:
		lvlspeed = randi_range(1, 3)
	elif lvlspeed > 149:
		lvlspeed = randi_range(2, 5)
	print("enemy's speed", lvlspeed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pause = get_parent().timer
	if pause == 1:
		$AnimatedSprite2D.play("idle")
		$Timer.set_paused(true)
	else:
		$Timer.set_paused(false)
		$AnimatedSprite2D.play("default")
		
	if pause == 1:
		pass
	else:
		position.x = position.x + xspeed
		position.y = position.y + yspeed
		$AnimatedSprite2D.play("default")


func _on_timer_timeout() -> void:
	var playery = get_parent().get_parent().get_node("player").global_position.y
	var playerx = get_parent().get_parent().get_node("player").global_position.x
	
	if global_position.y < playery:
		yspeed = 2 + lvlspeed
	elif global_position.y > playery:
		yspeed = -2 - lvlspeed
	else:
		yspeed = 1

	if global_position.x > playerx:
		xspeed = -3 - lvlspeed
		$AnimatedSprite2D.flip_h = true
	elif global_position.x < playerx:
		xspeed = 3 + lvlspeed
		$AnimatedSprite2D.flip_h = false
	else:
		xspeed = 1


func _on_area_entered(area: Area2D) -> void:
	get_parent().get_parent().get_node("scoreboard").score += 1
	get_parent().enemies -= 1
	queue_free()


func _on_enemyhitbox_area_entered(area: Area2D) -> void:
	get_parent().enemies -= 1
	queue_free()
