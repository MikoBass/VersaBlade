extends Node2D
@onready var playerScene = load("res://scenes/player.tscn")
@onready var player = playerScene.instantiate()
const throwSpeed = 5
var bladeDirection = 1
var bladeReturning = false
var bladeTime = 0

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name=="player" and bladeReturning:
		queue_free()
		

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#position.x = move_toward(position.x, (position.x+20)*bladeDirection, 10)
	if bladeTime < 40 and bladeReturning == false:
		position.x += throwSpeed * bladeDirection
		bladeTime += 1
		print(bladeTime)
	elif bladeReturning == true:
		position.x = move_toward(position.x, (player.position.x-10), 10)# find a way to make it move towards the live player
		position.y = move_toward(position.y, (player.position.y+10), 10)
		#position.x += throwSpeed * bladeDirection
	
