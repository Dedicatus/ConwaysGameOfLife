extends Node

export var rowNumber = 10
export var colNumber = 10
export var offset = 100
#var isPlaying = false

var block = preload("res://Scenes/Block.tscn")

var myGrid = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for r in range(colNumber):
		for c in range(rowNumber):
			var newBlock = block.instance()
			add_child(newBlock)
			newBlock.set_position(Vector2(r * offset + 50, c * offset + 50))
			myGrid[Vector2(r,c)] = newBlock
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if (get_node("/root/Grid").isPlaying):
#		print("haha")
#	pass
