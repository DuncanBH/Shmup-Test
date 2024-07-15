class_name AI_LookAtPlayer extends Node

@onready var player : Player = Globals.player
@onready var enemy : CharacterBody2D = $".."


func _physics_process(_delta):
	enemy.look_at(player.position)
	enemy.rotation_degrees -= 90
