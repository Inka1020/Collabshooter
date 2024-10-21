extends Area2D
var direction = 0
var speed = 30
# Called when the node enters the scene tree for the first time.
func _ready():
	if Input.is_action_pressed("left"):
		direction = 1
	if Input.is_action_pressed("right"):
		direction = 2
	if Input.is_action_pressed("up"):
		direction = 3
	if Input.is_action_pressed("down"):
		direction = 4

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if direction == 1:
		position.x = position.x-speed
	if direction == 2:
		position.x = position.x+speed
	if direction == 3:
		position.y = position.y-speed
	if direction == 4:
		position.y = position.y+speed
	if direction == 0:
		queue_free()


func _on_body_entered(body):
	queue_free()
