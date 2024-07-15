class_name AI_FireBurstForwards extends Node2D

@onready var enemy = $".."

@onready var projectiles = Projectiles
@onready var cooldown_timer = $CooldownTimer

@export var bullet_scene = preload("res://scenes/Enemy/enemy_bullet.tscn")

@export var burstTiming : float = 0.5
@export var burstSize : int = 5

var doFire := false
var burstShotsFired := 0
var burstTimer := 0.0

func _on_timer_timeout():
	doFire = true

func _process(delta):
	if (doFire == true):
		if (burstTimer >= burstTiming && burstShotsFired < burstSize):
			var bullet = bullet_scene.instantiate()
			
			bullet.set_position(global_position)
			bullet.rotation = enemy.rotation
			
			# Instantiate
			projectiles.add_child(bullet)
			
			burstShotsFired += 1
			burstTimer = 0
			
		elif (burstShotsFired >= burstSize):
			doFire = false
			cooldown_timer.start()
			burstShotsFired = 0 
		
		burstTimer += delta
