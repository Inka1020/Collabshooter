extends Node2D

var enemy = preload("res://enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var spawnposition = randi_range(-800, 800)
	var newenemy = enemy.instantiate()
	add_child(newenemy)
	newenemy.global_position.x = position.x
	newenemy.global_position.y = position.y + spawnposition
