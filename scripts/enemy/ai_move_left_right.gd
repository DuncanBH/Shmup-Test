class_name AI_MoveLeftRight extends Node

@onready var enemy : CharacterBody2D = $".."

@export var moveSpeed : float = 5
@export var moveDistance : float = 5

@onready var leftLimit : float = -moveDistance
@onready var rightLimit : float = moveDistance
var moveDirection = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (enemy.position.x > rightLimit || enemy.position.x < leftLimit):
		moveDirection *= -1
		
	enemy.velocity.x = moveSpeed * moveDirection
	
	enemy.move_and_slide()
