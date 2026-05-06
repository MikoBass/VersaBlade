extends CharacterBody2D
@onready var versaBladeScene = load("res://scenes/versablade.tscn")

const SPEED = 300.0 #pixels per second
const JUMP_VELOCITY = -400.0 # negative number means go up
const DECEL = 20; # set decelaration speed
const THROW_SPEED = 200
var jumpCounter = 0;

func throw():
	var versaBlade = versaBladeScene.instantiate()
	add_child(versaBlade) # adds the thing to scene
	versaBlade.global_position = position # sets things position to players on spawn
	versaBlade.set_as_top_level(true) # lets the spawned thing not follow the player
# add a thing that makes the blade move

func _physics_process(delta: float) -> void:
	if is_on_floor():
		jumpCounter = 0;
	if not is_on_floor():
		velocity += get_gravity() * delta # apply gravity function to all move vectors per frame
		# generally the easiest way can fuck with it too modify jump feel
	if Input.is_action_just_pressed("mov_jump") and jumpCounter < 2:# and is_on_floor(): # checks if space pressed and on floor
		velocity.y = JUMP_VELOCITY # sets y vector to the jump velocity
		jumpCounter += 1 # counts jumps until its 2 so the double jump is the max
		throw()
		#double jump requires a jump counter to interact with this and to zero it after touching the floor
		# havent added a floor so not just yet
	if Input.is_action_pressed("mov_left") and not Input.is_action_pressed("mov_right"):
		velocity.x = move_toward(velocity.x, -SPEED, 15)
	elif Input.is_action_pressed("mov_right") and not Input.is_action_pressed("mov_left"):
		velocity.x = move_toward(velocity.x, SPEED, 15)
	else:
		velocity.x = move_toward(velocity.x, 0, DECEL) 
	move_and_slide() # applies all _physics_process program to player this goes at the end
	#if (Input.is_action_pressed("mov_right") and Input.is_action_pressed("mov_left")) or (( not Input.is_action_pressed("mov_right") and not Input.is_action_pressed("mov_left"))):s
		# my movement system sure does work
		# cant wait till that one bug appears that fucks with direction god i hope it wont
"""func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
"""
