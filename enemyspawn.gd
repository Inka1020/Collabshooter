extends Node2D

var enemy = preload("res://enemy.tscn")
var enemies = 0
var level = 1
var timer = 1
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.set_paused(true)
	var score = get_parent().get_node("scoreboard").score


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score = get_parent().get_node("scoreboard").score
	
	if Input.is_action_just_pressed("pause"):
		if timer == 1:
			timer = 0
			$Timer.set_paused(false)
		else:
			timer = 1
			$Timer.set_paused(true)
			#print("enemy spawner timer paused")
	
	if score <= 2: #levels up based on score / changes enemies allowed based on score
		level = 1
	elif score <= 5:
		level = 2
	elif score <= 30:
		level = score/3
	else:
		level = 11

func _on_timer_timeout() -> void:
	var spawnpositiony = randi_range(-800, 800)#randomizes y position
	var spawnpositionx = [0, 1320][randi_range(0, 1)]#randomizes whether they come from left or right
	
	#print("timer timedout")
	
	if enemies < level:
		var newenemy = enemy.instantiate()
		add_child(newenemy)
		newenemy.global_position.x = position.x - spawnpositionx
		newenemy.global_position.y = position.y + spawnpositiony
		enemies = enemies + 1
		print("enemy amount",enemies)
		print("enemies allowed", level)
