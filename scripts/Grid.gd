extends Node

var offset = 60

var blockA = preload("res://Scenes/BlockA.tscn")
var blockB = preload("res://Scenes/BlockB.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for r in range(Global.rowNumber):
		for c in range(Global.colNumber):
			var newBlock
			if (r + c) % 2 == 0:
				newBlock = blockA.instance()
			else:
				newBlock = blockB.instance()
			newBlock.set_Index(c, r)
			add_child(newBlock)
			newBlock.set_position(Vector2(c * offset + 30, r * offset + 90))
			Global.myGrid[Vector2(c,r)] = newBlock
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.isPlaying:
		Global.stepTimer += delta
		if Global.stepTimer > Global.stepTime:
			next_Step()
			Global.stepTimer = 0
	pass

func next_Step():
	Global.gridChanged = false
	
	for r in range(Global.rowNumber):
			for c in range(Global.colNumber):
				Global.myGrid[Vector2(c,r)].apply_Populate_Rule()
	for r in range(Global.rowNumber):
			for c in range(Global.colNumber):					
				Global.myGrid[Vector2(c,r)].update_Block()				
	if Global.gridChanged:
		Global.stepNum = Global.stepNum + 1
		Global.player.play()
	pass

func clear_Grid():
	Global.stepNum = 0
	
	for r in range(Global.rowNumber):
			for c in range(Global.colNumber):
				Global.myGrid[Vector2(c,r)].populated = false
				Global.myGrid[Vector2(c,r)].populatedNextStep = false
				Global.myGrid[Vector2(c,r)].displayBlock.visible = false
	pass
