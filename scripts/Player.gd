class_name Player extends CharacterBody2D

@onready var weapon : Weapon = $Weapon
@onready var health : Health = $Health
@onready var animation_player = $AnimationPlayer

@export var SPEED := 300.0
@export var SLOW_SPEED := 150

var currentSpeed := SPEED

func _ready():
	Globals.player = self # Register self in Globals 
	
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
	get_tree().reload_current_scene() # TODO: better resetting on death
	print("Player died")


func _on_health_health_changed(old_value, new_value):
	$AnimationPlayer.stop(true)
	$AnimationPlayer.play("hit")


func _on_hitbox_body_entered(body):
	if body is Bullet && body.alignment == Bullet.Alignments.ENEMY:
		health.damage(body.BulletDamage)
		body.processHit(true)

