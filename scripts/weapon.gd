class_name Weapon extends Node2D

@export var bullet = preload("res://scenes/Weapons/auto_cannon_bullet.tscn")
@export var weaponAnim : AnimatedSprite2D

@export var weaponCooldown : float = 10.0
var timer: float = 0
var firingSide := -1

func fire():
	weaponAnim.play("Fire")

func _on_auto_cannon_anim_animation_looped():
	weaponAnim.play("Idle")

func _process(delta):
	timer += delta
	
	if weaponAnim.animation == "Fire" && timer > weaponCooldown:
		var bullet = bullet.instantiate()
		add_child(bullet)
		bullet.position.x += 20 * firingSide
		
		if (firingSide == -1):
			firingSide = 1
		else:
			firingSide = -1
		
		timer = 0
