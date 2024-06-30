extends CharacterBody2D

@onready var weapon : Weapon = $Weapon

@export var SPEED := 300.0
@export var SLOW_SPEED := 150

var currentSpeed := SPEED

func _process(delta):
	if (Input.is_action_pressed("Slow")):
		currentSpeed = SLOW_SPEED
	else:
		currentSpeed = SPEED
		
	if (Input.is_action_pressed("Fire")):
		weapon.fire() 

func _physics_process(delta):
	var inputs = Vector2(Input.get_axis("Left", "Right"), Input.get_axis("Up", "Down"))

	velocity = inputs * currentSpeed

	velocity = velocity.limit_length(currentSpeed)

	move_and_slide()
