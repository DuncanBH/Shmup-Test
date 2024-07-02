class_name Weapon extends Node2D

@onready var projectiles = Projectiles

@export var bullet_scene = preload("res://scenes/Weapons/auto_cannon_bullet.tscn")
@export var weaponAnim : AnimatedSprite2D

@export var weaponCooldown : float = 10.0

var timer: float = 0
var firingSide := -1
var focusFiring := false

func fire():
	weaponAnim.play("Fire")

func _on_auto_cannon_anim_animation_looped():
	weaponAnim.play("Idle")

func _process(delta):
	timer += delta
	
	var spread = 20 if !focusFiring else 5
	
	if weaponAnim.animation == "Fire" && timer > weaponCooldown:
		# Prep bullet
		var bullet = bullet_scene.instantiate()
		
		bullet.set_position(get_parent().position)
		bullet.position.x += spread * firingSide
		
		bullet.rotation_degrees += float(spread)/5 * firingSide
		
		# Instantiate
		projectiles.add_child(bullet)
		
		# Flip firing side
		if (firingSide == -1):
			firingSide = 1
		else:
			firingSide = -1
		
		timer = 0
