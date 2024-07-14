extends Node2D

const TWEEN_SCALE_TIME = 0.1

@onready var SPRITE2D = $Sprite2D
@export var TEXTURE : Texture
@export var speed_rotation : float = 0.5

const PLANET_SPRING = preload("res://assets/planet/spring.png")
const PLANET_SUMMER = preload("res://assets/planet/summer.png")
const PLANET_AUTUMN = preload("res://assets/planet/autumn.png")
const PLANET_WINTER = preload("res://assets/planet/winter.png")
const PLANET_HELL0 = preload("res://assets/planet/hell0.png")
const PLANET_BLACK_HOLE = preload("res://assets/planet/black_hole.png")

var planet_style = [
	PLANET_SPRING, 
	PLANET_SUMMER, 
	PLANET_AUTUMN,
	PLANET_WINTER,
	PLANET_HELL0,
	PLANET_BLACK_HOLE]

var default_scale : Vector2 = Vector2.ONE
var tween_size_add : Vector2 = Vector2.ONE * 0.2

var status : String = "null"


# Called when the node enters the scene tree for the first time.
func _ready():
	default_scale = scale
	SPRITE2D.texture = TEXTURE
	match SPRITE2D.texture:
		PLANET_SPRING: status = "spring"
		PLANET_SUMMER: status = "summer"
		PLANET_AUTUMN: status = "autumn"
		PLANET_WINTER: status = "winter"
		PLANET_HELL0: status = "hello"
		PLANET_BLACK_HOLE: status = "black_hole"
		

	
func _physics_process(delta):
	rotation += speed_rotation * delta


func _on_mouse_entered():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", default_scale + tween_size_add, TWEEN_SCALE_TIME)


func _on_mouse_exited():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", default_scale, TWEEN_SCALE_TIME)


func _on_area_2d_area_entered(area):
	pass # Replace with function body.


func _on_timer_timeout():
	match SPRITE2D.texture:
		PLANET_SPRING:
			SPRITE2D.texture = PLANET_SUMMER
			status = "summer"
		PLANET_SUMMER:
			SPRITE2D.texture = PLANET_AUTUMN
			status = "autumn"
		PLANET_AUTUMN:
			SPRITE2D.texture = PLANET_WINTER
			status = "winter"
		PLANET_WINTER:
			SPRITE2D.texture = PLANET_HELL0
			status = "hell0"
		PLANET_HELL0:
			SPRITE2D.texture = PLANET_BLACK_HOLE
			status = "black_hole"
		PLANET_BLACK_HOLE:
			SPRITE2D.texture = planet_style.pick_random()
			match SPRITE2D.texture:
				PLANET_SPRING: status = "spring"
				PLANET_SUMMER: status = "summer"
				PLANET_AUTUMN: status = "autumn"
				PLANET_WINTER: status = "winter"
				PLANET_HELL0: status = "hello"
				PLANET_BLACK_HOLE: status = "black_hole"
	pass # Replace with function body.
