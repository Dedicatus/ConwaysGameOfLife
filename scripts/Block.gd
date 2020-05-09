extends Area2D

export var row = 0
export var column = 0

var populated = false
var displayBlock


# Called when the node enters the scene tree for the first time.
func _ready():
	displayBlock = get_node("Display")
	print("asd")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if (get_node("/root/Grid").isPlaying):
#		print("haha")
#	pass



func _on_Block_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		if populated:
			populated = false
			displayBlock.visible = false
		else:
			populated = true
			displayBlock.visible = true
	pass # Replace with function body.
