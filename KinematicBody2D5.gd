
extends KinematicBody2D
#
#
#
var EnemyMotion = Vector2()
var EnemyDirection = 1
var UP = Vector2(0,-1)
var OppositeDirection = -1
var EnemySpeed = 300

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


