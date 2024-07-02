class_name EnemyBullet extends AnimatableBody2D

@export var BulletDamage := 1
@export var BulletSpeed : int = 6

@onready var animation_player = $AnimationPlayer

func _physics_process(_delta):
	position += transform.y * BulletSpeed

func processHit(isEnemy := false):
	if isEnemy:
		animation_player.play("hit")
	else:
		print("miss")
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
