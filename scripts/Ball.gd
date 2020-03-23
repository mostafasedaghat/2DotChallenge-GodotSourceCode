extends Node2D


export var speed = 8
export(Texture) var bluesprite
export(Texture) var redsprite

var ballName

onready var ballsprite = $ballSprite

func _ready():
	randomize()
	_setColor(randf())

func _setColor(value):
	print(value)
	if value > 0.5:
		ballsprite.texture = bluesprite
		ballName = "blue"
	else:
		ballsprite.texture = redsprite
		ballName= "red"

func _process(delta):
	position.y += speed
	
	
