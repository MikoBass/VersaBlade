extends Node2D
@onready var playerScene = load("res://scenes/player.tscn")
const throwSpeed = 5
var bladeReturning = false
var bladeTime = 0
var bladeRmPrimer = 0


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player" and bladeReturning:
			queue_free()
	
		
		
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(bladeReturning)
	if bladeTime < 40 and bladeReturning == false:
		position.x += throwSpeed * Game.bladeDirection
		bladeTime += 1
	elif bladeReturning == true:
		$CollisionShape2D.disabled = true
		position.x = move_toward(position.x, (Game.playerPos.x), 10)
		position.y = move_toward(position.y, (Game.playerPos.y), 10)
		if (position.x == Game.playerPos.x and position.y == Game.playerPos.y):
			queue_free()
	if bladeTime >= 40:
		$CollisionShape2D.disabled = false
	
