extends Node2D

onready var scoretext = $scorevalue

onready var playbtn =$playAnimation

func _ready():
	playbtn.play("idle")

func _process(delta):
	if Input.is_action_just_pressed("space"):
		get_node("Area2D").on_click()
