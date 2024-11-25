extends Node2D

var checkpoint = 0

var playerPos = Vector2(300, 500)
var player2Pos = Vector2(100 + 580, 575)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player.setPosition(playerPos)
	$Player2.setPosition(player2Pos)
	spawn_movspikeS(Vector2(150, 300))
	spawn_trap(Vector2(1120, 416))
	spawn_trap(Vector2(32, 544))
	spawn_movspikeV(Vector2(270, 50))
	spawn_movspikeV(Vector2(700, 70))
	spawn_movspikeV(Vector2(900, 70))
	spawn_trap(Vector2(543, 32))
	spawn_trap(Vector2(1120,32))
	spawn_movspikeV(Vector2(418, -150))
	spawn_movspikeV(Vector2(994, -150))
	spawn_trap(Vector2(96, -190))
	spawn_movspikeV(Vector2(538, -736))
	spawn_movspikeV(Vector2(860, -950))
	spawn_movspikeV(Vector2(284, -1000))
	
	##nextLevel()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#var currLevel = $Levels.get_child(levelNum)
	#if currLevel != null:
	var currDoor = $Door
	var currDoor2 = $Door2
	if currDoor.playerDone:
		$Player.setPosition(Vector2(0, 715))
	if currDoor2.player2Done:
		$Player2.setPosition(Vector2(0, 715))
	if currDoor.playerDone && currDoor2.player2Done:
		win()
	if abs($Player.position.y - $Player2.position.y) > 350 && (!currDoor.playerDone && !currDoor2.player2Done):
		if $Player.position.y < $Player2.position.y:
			reset2()
		else:
			reset1()
	if $Player.position.y > $Player2.position.y:
		$Player2/Camera2D2.make_current()
		#$Player/Camera2D2.current(false)
	else:
		$Player/Camera2D2.make_current()
		#$Player2/Camera2D2.current(false)
		#
func win():
	$Win.show()
	
#func nextLevel():
	#levelNum += 1
	#if levelNum == 1:
		#playerPos = Vector2(300, 475)
		#player2Pos = Vector2(300 + 580, 475)
		#spawn_trap(Vector2(1120, 416))
		#spawn_trap(Vector2(32, 544))
	#elif levelNum == 2:
		#playerPos = Vector2(100, 475)
		#player2Pos = Vector2(100 + 580, 475)
	#$Levels.show_level(levelNum, totalLevels)
	#reset()

func spawn_trap(position: Vector2):
	var trap_instance = preload("res://Spike.tscn").instantiate()
	trap_instance.position = position
	trap_instance.death1.connect(reset1)
	trap_instance.death2.connect(reset2)
	
	move_child(trap_instance, 2)
	$Traps.add_child(trap_instance)

func spawn_movspikeV(position: Vector2):
	var movspike_instance = preload("res://sprites/moveableSpikeV.tscn").instantiate()
	movspike_instance.position = position
	movspike_instance.death1.connect(reset1)
	movspike_instance.death2.connect(reset2)
	
	move_child(movspike_instance, 2)
	$Traps.add_child(movspike_instance)
	
func spawn_movspikeS(position: Vector2):
	var movspike_instance = preload("res://sprites/moveableSpikeS.tscn").instantiate()
	movspike_instance.position = position
	movspike_instance.death1.connect(reset1)
	movspike_instance.death2.connect(reset2)
	
	move_child(movspike_instance, 2)
	$Traps.add_child(movspike_instance)
	
	
func reset1():
	$Control/AnimationPlayer.play("death_1")
	await get_tree().create_timer(0.5).timeout
	$Player.setPosition(playerPos)
	$Player2.setPosition(player2Pos)

func reset2():
	$Control2/AnimationPlayer.play("death_anim")
	await get_tree().create_timer(0.5).timeout
	$Player.setPosition(playerPos)
	$Player2.setPosition(player2Pos)

func _on_kill_thingy_body_entered(body: Node2D) -> void:
	pass
	#if body.name == "Player" || body.name == "Player2":
		#reset()


func _on_character_body_2d_death() -> void:
	reset1()
	
