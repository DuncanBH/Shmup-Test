class_name Enemy extends CharacterBody2D


# temporarilty until bullets are reworked
func damage(dmg: int):
	$Health.damage(dmg) 


func _on_health_health_depleted():
	print("Enemy defeated!")
	queue_free()


func _on_hitbox_body_entered(body):
	if body is Bullet && body.alignment == Bullet.Alignments.PLAYER:
		damage(body.BulletDamage)
		body.processHit(true)
