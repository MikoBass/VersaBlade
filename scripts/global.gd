extends Node2D
var playerScene = load("res://scenes/player.tscn")
var player = playerScene.instantiate()
var playerPos = player.position

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	playerPos = player.global_position
