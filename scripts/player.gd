extends Node2D

@onready var GAME_OVER = preload("res://scene/child/game_over.tscn")

var stamina : int = 5
var area_name = "player"

func _process(delta):
	var game_over = GAME_OVER.instantiate()
	if stamina <= 0:
		add_child(game_over)
