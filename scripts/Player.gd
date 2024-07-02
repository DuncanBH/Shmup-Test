extends CharacterBody2D

@onready var weapon : Weapon = $Weapon
@onready var health : Health = $Health
@onready var animation_player = $AnimationPlayer

@export var SPEED := 300.0
@export var SLOW_SPEED := 150

var currentSpeed := SPEED

func _process(_delta):
	if (Input.is_action_pressed("Slow")):
		currentSpeed = SLOW_SPEED
		weapon.focusFiring = true
	else:
		currentSpeed = SPEED
		weapon.focusFiring = false
		
	if (Input.is_action_pressed("Fire")):
		weapon.fire() 


func _physics_process(_delta):
	var inputs = Vector2(Input.get_axis("Left", "Right"), Input.get_axis("Up", "Down"))

	velocity = inputs * currentSpeed

	velocity = velocity.limit_length(currentSpeed)

	move_and_slide()


func _on_health_health_depleted():
	print("dead!")


func _on_health_health_changed(old_value, new_value):
	$AnimationPlayer.stop(true)
	$AnimationPlayer.play("hit")


func _on_hitbox_body_entered(body):
	if body is EnemyBullet:
		health.damage(body.BulletDamage)
		body.processHit(true)

