extends Control

var pause = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$pausebtn.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		if pause == 0:
			pause = 1
			$pausebtn.hide()
			$Pause.text = "Pause"
			$belowtext.text = "Press below to resume"
			$Pause.show()
			$belowtext.show()
		else:
			pause = 0
			$Pause.hide()
			$belowtext.hide()
			$pausebtn.show()
