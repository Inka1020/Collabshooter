extends CharacterBody2D

var speed = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var playery = get_parent().get_parent().get_node("player").global_position.y
	var playerx = get_parent().get_parent().get_node("player").global_position.x
	print(playery)
	if global_position.y < playery:
		position.y = position.y + speed
	if global_position.y > playery:
		position.y = position.y - speed
		
	if global_position.x > playerx:
		position.x = position.x + 12
	if global_position.x < playerx:
		position.x = position.x - 12
	if global_position.x == playerx:
		position.x = position.x - 12
