extends Button


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Play_pressed() -> void:
	if !Global.isPlaying:
		Global.stepTimer = 0
		Global.isPlaying = true
		set_text("Stop")
	else:
		Global.isPlaying = false
		set_text("Play")
	pass # Replace with function body.


func _on_Next_pressed() -> void:
	get_tree().get_root().get_node("Scene/Grid").next_Step()
	pass # Replace with function body.


func _on_Clear_pressed() -> void:
	get_tree().get_root().get_node("Scene/Grid").clear_Grid()
	pass # Replace with function body.
