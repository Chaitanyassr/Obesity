
extends KinematicBody2D


'''defining var and const'''
var UP = Vector2(0, -1)
var motion = Vector2()
onready var score = scorescore.score1
var health = 4
var timer : float = 0
var fly = false
var jump = 0


'''function for the game'''
func _ready():
	set_physics_process(true)
	set_process(true)
	
func _process(delta):
	var labelnode = get_parent().get_node("scorecard/CanvasLayer/Control/Label")
	labelnode.text = str(score)

	




func _physics_process(delta):
	if(timer > 0): timer -= delta
	if(timer <= 0): timer = 0

	motion.y += 50 
	

	
	
	
	var friction = false
	
	
	
	
	

		
	if Input.is_action_pressed("ui_down"):

		if Input.is_action_pressed("ui_right"):
			motion.x = min(motion.x+20, 500)   
			$Sprite.flip_h = false


			

			
		elif Input.is_action_pressed("ui_left"):
			motion.x = max(motion.x-20, -500)
			$Sprite.flip_h = true
			

		else:
			

			friction = true
			

	
	elif Input.is_action_pressed("ui_right"):
		$Sprite.play("fly")
		motion.x = min(motion.x+20, 500)   
		$Sprite.flip_h = false




	elif Input.is_action_pressed("ui_left"):
		$Sprite.play("fly")
		motion.x = max(motion.x-20, -500)

	 $Sprite.flip_h = true
	
	
	
	
	else: 
		
		friction = true


	if motion.y < 0:
		$Sprite.play("fly2")
		
		
		

	if is_on_floor():
		

###
		#sky walk
		if Input.is_action_just_pressed("ui_up"):
			var jump = get_parent().get_node("sounds/jump")
			jump.play()
			var sound = get_parent().get_node("sounds/jump2")
			sound.start()



			fly = true
			$fly.start()
			motion.y = -1000
			

##
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	elif Input.is_action_just_pressed("ui_up") and fly == true:
		var jump = get_parent().get_node("sounds/jump")
		jump.play()
		var sound = get_parent().get_node("sounds/jump2")
		sound.start()
		motion.y = -600
		$Sprite.play("fly2")
		if friction == true:
				motion.x = lerp(motion.x, 0, 0.2)


	motion = move_and_slide(motion, UP)
	



#
func TakeDamage(amount):
    if(timer == 0):
        health-=amount
#
        if (health == 3):
                var heart1 = get_parent().get_node("health/CanvasLayer/Control/heart1")
                heart1.hide()
                var player = get_parent().get_node("player/Camera2D/ScreenShake")
                player.start()
                $CanvasModulate.show()
                $redshock.start()
                death()



#             
#
        elif (health == 2):
                var heart2 = get_parent().get_node("health/CanvasLayer/Control/heart2")
                heart2.hide()
                var playe = get_parent().get_node("player/Camera2D/ScreenShake")
                playe.start()
                $CanvasModulate.show()
                $redshock.start()
                death()
        elif (health == 1):
                var heart3 = get_parent().get_node("health/CanvasLayer/Control/heart3")
                heart3.hide()
                var timer = get_parent().get_node("health/Timer")
                timer.start()
                var play = get_parent().get_node("player/Camera2D/ScreenShake")
                play.start()
                $CanvasModulate.show()
                $redshock.start()
                $Particles2D.show()
                death()
    timer = 1 #how long you want the time between hits to be in seconds
#




func _on_Timer_timeout():
	get_tree().change_scene("losenote.tscn")



func _on_fly_timeout():
	fly = false



func _on_Area2D_body_entered(body):
	if body.get_name() == get_name():
		TakeDamage(1)
	pass # Replace with function body.


func _on_redshock_timeout():
	$CanvasModulate.hide()
	pass # Replace with function body.


func _on_dial_body_entered(body):
	if body.get_name() == get_name():
		var dial = get_parent().get_node("dialouge/CanvasLayer/NinePatchRect")
		dial.show_text("intro" ,"MAX")







func _on_blue_egg_body_entered(body):
	score += 100
	scorescore.score1 += 100
	var sound = get_parent().get_node("sounds/pickup")
	sound.play()
	var soundt = get_parent().get_node("sounds/pickupsound")
	soundt.start()
	pass # Replace with function body.


func _on_redegg_body_entered(body):
	score += 10
	scorescore.score1 += 10
	var sound = get_parent().get_node("sounds/pickup")
	sound.play()
	var soundt = get_parent().get_node("sounds/pickupsound")
	soundt.start()
	pass # Replace with function body.
func death():
	var death = get_parent().get_node("sounds/death")
	death.play()
	var sound = get_parent().get_node("sounds/death2")
	sound.start()


func _on_death2_timeout():
	var death = get_parent().get_node("sounds/death")
	death.stop()
	pass # Replace with function body.


func _on_jump2_timeout():
	var cake = get_parent().get_node("sounds/jump")
	cake.stop()
	pass # Replace with function body.


func _on_pickupsound_timeout():
	var sound = get_parent().get_node("sounds/pickup")
	sound.stop()
	pass # Replace with function body.
