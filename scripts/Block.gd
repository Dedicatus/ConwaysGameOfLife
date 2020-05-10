extends Area2D

var row: int  = 0
var col: int  = 0

var populated = false
var populatedNextStep = false
var myGrid
var displayBlock


# Called when the node enters the scene tree for the first time.
func _ready():
	#myGrid = get_node("Grid")
	displayBlock = get_node("Display")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#
#	pass


func _on_Block_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		if populated:
			populated = false
			populatedNextStep = false
			displayBlock.visible = false
		else:
			populated = true
			populatedNextStep = true
			displayBlock.visible = true
	pass # Replace with function body.

func set_Index(c: int, r:int):
	col = c
	row = r
	pass
	
func apply_Populate_Rule():
	var count: int = 0
	for r in range(-1,2):
		if (row + r) < 0 or (row + r) > Global.rowNumber - 1:
			continue
		else:
			for c in range (-1,2):
				if (col + c) < 0 or (col + c) > Global.colNumber - 1:
					continue
				else:
					if r != 0 or c != 0:
						if Global.myGrid[Vector2(col + c, row + r)].get_Populated():
							count = count + 1

	#print(str(col) + "," + str(row) + " count = " + str(count) + " populated = " + str(populated) )	
		
	if populated:
		if count <= 1:
			populatedNextStep = false
		elif count >= 4:
			populatedNextStep = false
	else:
		if count == 3:	
			populatedNextStep = true			
	pass

func update_Block():
	populated = populatedNextStep
	if populated:
		displayBlock.visible = true
	else:
		displayBlock.visible = false
	pass

func get_Populated() -> bool:
	return populated
