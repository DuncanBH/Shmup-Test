class_name AutoCannonBullet extends Node2D

@export var BulletSpeed : int = 6
@onready var animation_player = $AnimationPlayer

func _ready():
    #print("bullet check")
    pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    position.y -= BulletSpeed
 
func _on_area_2d_body_entered(body):
    if body is Enemy:
        body.damage(1)
        animation_player.play("hit")
        
    else:
        queue_free()
