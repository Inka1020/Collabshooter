extends Node2D

var enemy = preload("res://enemy.tscn")
var enemies = 0
var level = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var score = get_parent().get_node("scoreboard").score
	if score <= 2: #levels up based on score / changes enemies allowed based on score
		level = 1
	if score <= 5:
		level = 2
	else:
		level = score/3

func _on_timer_timeout() -> void:
	var spawnpositiony = randi_range(-800, 800)#randomizes y position
	var spawnpositionx = [0, 1320][randi_range(0, 1)]#randomizes whether they come from left or right
	
	if enemies < level:
		var newenemy = enemy.instantiate()
		add_child(newenemy)
		newenemy.global_position.x = position.x - spawnpositionx
		newenemy.global_position.y = position.y + spawnpositiony
		enemies = enemies + 1
		print("enemy amount",enemies)
		print("enemies allowed", level)
