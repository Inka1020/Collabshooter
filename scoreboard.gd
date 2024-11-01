extends Control

var score = 0
var lives = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	$scoretext.text = "Score: " + str(score)
	$lives.text = "Lives: " + str(lives)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	lives = get_parent().get_node("player").lives
	$scoretext.text = "Score: " + str(score)
	$lives.text = "Lives: " + str(lives)
