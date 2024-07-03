@tool
class_name Bullet extends AnimatableBody2D

@export var BulletDamage := 1
@export var BulletSpeed : int = 6

@onready var visibleOnScreenNotifier2d := $VisibleOnScreenNotifier2D

func _ready():
	visibleOnScreenNotifier2d.screen_exited.connect(_on_visible_on_screen_notifier_2d_screen_exited)
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _get_configuration_warnings():
	if not visibleOnScreenNotifier2d:
		return ["This node must have a visibleOnScreenNotifier2d child."]
	return []

