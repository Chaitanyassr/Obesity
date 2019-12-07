
extends KinematicBody2D
#
#
#
var EnemyMotion = Vector2()
var EnemyDirection = 1
var UP = Vector2(0,-1)
var OppositeDirection = -1
var EnemySpeed = 1000

func _ready():
 set_physics_process(true)
#
#
func _physics_process(delta):
#
#
#
#
	 if is_on_wall():
		  EnemyDirection = EnemyDirection * OppositeDirection
	
#
	 EnemyMotion.x = EnemyDirection * EnemySpeed
#
	 EnemyMotion = move_and_slide(EnemyMotion, UP)
#


func _on_Area2D_body_entered(body):
	
	pass # Replace with function body.