extends Node2D
@onready var playerScene = load("res://scenes/player.tscn")
@onready var player = playerScene.instantiate()
const throwSpeed = 1
var bladeDirection = 1
var bladeReturning = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name=="player" and bladeReturning:
		queue_free()
		

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += throwSpeed * bladeDirection
	
