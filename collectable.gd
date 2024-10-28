extends Area2D
var speed = 30#bullet speed
var direction = 0#player's direction
# Called when the node enters the scene tree for the first time.
func _ready():#when spawned
	direction = get_parent().dir #gets spawner's variable "dir"/player's direction

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(direction)
	if direction == 1:
		position.x = position.x-speed
	if direction == 2:
		position.x = position.x+speed
	if direction == 3:
		position.y = position.y-speed
	if direction == 4:
		position.y = position.y+speed
	if direction == 0: #this is checking if the direction was set properly, if 0 it is not
		print(direction)
#above code shoots bullet depending on whch way the player is faced

func _on_body_entered(body):
	queue_free()
