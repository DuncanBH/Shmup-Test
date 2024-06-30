class_name Enemy extends Node2D

@export var health := 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func damage(dmg: int):
	health -= dmg
	
	print(health)
	
	if (health < 0):
		print("dead!")
		queue_free()
