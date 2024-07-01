class_name Health extends Node2D

@export var MAX_HEALTH := 100
@onready var health := MAX_HEALTH

signal health_changed(old_value: int, new_value: int)
signal health_depleted

func damage(attack: int):
	var old_health = health
	health -= attack
	
	health_changed.emit(health, old_health)
	
	if health <= 0:
		health_depleted.emit()
