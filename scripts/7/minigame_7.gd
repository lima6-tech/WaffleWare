extends Node2D

@onready var timer: Node2D = $Timer 
@onready var player: CharacterBody2D = $Level/TopDownPlayer
@onready var apples: Node2D = $Level/Apples

var apples_collected = 0
var apples_to_collect = 0
var groups_to_delete = 3

func _ready() -> void:
	for apple in get_tree().get_nodes_in_group("apples"):
		if apple.has_signal("apple_collected"):
			apple.apple_collected.connect(apple_collect)

	setApples()

	timer.start_timer(5.0)

func _process(delta: float) -> void: 
	if player.position.x > 302: # allows the player to loop through the map
		player.position.x = -3
	elif player.position.x < -3:
		player.position.x= 302

	if not timer.timer_active:
		var success = (apples_collected >= apples_to_collect)
		Global._finish_minigame(success)

func apple_collect() -> void:
	apples_collected += 1

func setApples() -> void:
	var groups = apples.get_children() 

	if groups.is_empty(): return

	groups.shuffle() #shuffle the order of groups so removal is random

	for i in range(groups_to_delete):
		if i < groups.size():
			groups[i].queue_free()

	await get_tree().process_frame

	for group in apples.get_children():
		apples_to_collect += group.get_child_count() # count apples still alive
		
