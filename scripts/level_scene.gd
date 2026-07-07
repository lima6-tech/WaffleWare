extends Node2D

@onready var waffle_container: HBoxContainer = $WaffleContainer

@onready var waffle_1 = $WaffleContainer/Waffle1/Animation
@onready var waffle_2 = $WaffleContainer/Waffle2/Animation
@onready var waffle_3 = $WaffleContainer/Waffle3/Animation

@onready var waffles = [waffle_1, waffle_2, waffle_3]

@onready var level = $Level
@onready var timer = $Timer

var time = 0

func _ready() -> void:
	await Timer(5.0)

	if Global.minigames_done < 3:
		Global.minigames_done = Global.minigames_done + 1
		get_tree().change_scene_to_file("res://scenes/minigame_" + str(Global.minigames_done) + ".tscn") 
	else:
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn") 

func _process(delta: float) -> void: 
	for waffle in range(waffles.size()): #loops through the waffles and sets them visible
		waffles[waffle].visible = waffle < Global.lives
	
	waffle_container.visible = Global.lives > 0
	timer.text = str(time) 
	level.text = "00" + str(Global.minigames_done) 

func Timer(start_time: float): 
	time = start_time 

	while time > 0.0: 
		await wait(0.1) 
		time -= 0.1 

	return

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
