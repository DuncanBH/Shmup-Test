class_name Enemy extends CharacterBody2D

@onready var player := %Player

# temporarilty until bullets are reworked
func damage(damage: int):
	$Health.damage(damage) 
	
func _physics_process(delta):
	look_at(player.position)
	rotation_degrees -= 90


func _on_health_health_depleted():
	print("dead!")
	queue_free()
