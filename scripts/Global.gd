extends Node


# Declare member variables here. Examples:
var player = AudioStreamPlayer.new()

var myGrid = {}
var rowNumber: int  = 17
var colNumber: int  = 32

var isPlaying:bool = false
var gridChanged:bool = false
var stepNum:int = 0
var stepTime:float = 2
var stepTimer:float = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.add_child(player)
	player.stream = load("res://assets/sounds/waterDrop.wav")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
