class_name EnemyBullet extends Bullet

@onready var animation_player = $AnimationPlayer

func _physics_process(_delta):
	position += transform.y * BulletSpeed

func processHit(isEnemy := false):
	if isEnemy:
		animation_player.play("hit")
	else:
		print("miss")
		queue_free()
