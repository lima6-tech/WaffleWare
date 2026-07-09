extends Node2D

@onready var waffle_container: HBoxContainer = $WaffleContainer

@onready var waffle_1 = $WaffleContainer/Waffle1/Animation
@onready var waffle_2 = $WaffleContainer/Waffle2/Animation
@onready var waffle_3 = $WaffleContainer/Waffle3/Animation

@onready var waffles = [waffle_1, waffle_2, waffle_3]

@onready var level = $Level
@onready var timer = $Timer

var time: float = 5.00
var timer_active = true
var increase_level = false

func _ready() -> void:
	time = 5.00
	timer_active = true
	increase_level = false

	for waffle in range(waffles.size()): # loops through the waffles and sets them visible
		waffles[waffle].visible = waffle < Global.lives

	waffle_container.visible = Global.lives > 0

func _process(delta: float) -> void: 
	level.text = "00" + str(Global.minigames_done) 

	update_timer(delta)

	if time <= 3.00 and not increase_level:
		Global.minigames_done = Global.minigames_done + 1
		increase_level = true

	if not timer_active:
		if Global.minigames_done < 3:
			get_tree().change_scene_to_file("res://scenes/" + str(Global.minigames_done) + "/minigame_" + str(Global.minigames_done) + ".tscn") 
		else:
			get_tree().change_scene_to_file("res://scenes/title_screen.tscn") 

func update_timer(delta: float):
	if timer_active and time > 0.0:
		time -= delta
		timer.text = str(snapped(time, 0.01)) # rounds the number

	elif time <= 0.0:
		time = 0.0
		timer_active = false
