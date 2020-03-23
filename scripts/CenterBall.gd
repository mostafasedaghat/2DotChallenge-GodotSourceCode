extends Node2D

export var speed = 6

onready var topPos = $Top_Pos
onready var bottomPos = $Bottom_Pos

onready var centerball = $CenterBall
onready var timer = $Timer

onready var scoreText = $ScoreValue

export(PackedScene) var ball

var newBall




# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	_create_ball(randf())

func _process(delta):
	centerball.rotation += speed*delta
	
	if(Input.is_action_just_pressed("up")):
		_changeRotate()

func _changeRotate():
	speed *= -1
	
func _create_ball(value):
	print(value)
	if (value > 0.5):
		newBall = ball.instance()
		add_child(newBall)
		newBall.position = topPos.position
		newBall.speed = 8
		
	else:
		newBall = ball.instance()
		add_child(newBall)
		newBall.position = bottomPos.position
		newBall.speed = -8

func _on_RedArea_area_entered(area):
	print(area.name)
	if (newBall.ballName == "red"):
		print("get score")
		newBall.queue_free()
		_create_ball(randf())
		_setScore()
	else:
		print("gameover")
		_gameover()
		newBall.queue_free()
		


func _on_BlueArea_area_entered(area):
	print(area.name)
	
	if (newBall.ballName == "blue"):
		print("get score")
		newBall.queue_free()
		_setScore()
		_create_ball(randf())
	else:
		print("gameover")
		_gameover()
		newBall.queue_free()

func _gameover():
	self.queue_free()
	get_tree().get_root().get_node("main").showMenu()
	get_tree().get_root().get_node("main/GameOverSound").play()
	self.queue_free()
	
func _setScore():
	$CollideSound.play()
	get_tree().get_root().get_node("main").score +=1
	scoreText.text = str(get_tree().get_root().get_node("main").score)
