class_name Enemy extends CharacterBody2D

@onready var player := %Player

# temporarilty until bullets are reworked
func damage(dmg: int):
	$Health.damage(dmg) 
	
func _physics_process(_delta):
	look_at(player.position)
	rotation_degrees -= 90

func _on_health_health_depleted():
	print("dead!")
	queue_free()

func _on_hitbox_body_entered(body):
	if body is AutoCannonBullet:
		damage(body.BulletDamage)
		body.processHit(true)
