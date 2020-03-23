extends Node2D

onready var splash =$Splash

export(PackedScene) var game
export(PackedScene) var menu

var menuScene
var gameScene

var score = 0

func _ready():

	var t = Timer.new()
	t.set_wait_time(1.5)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t,"timeout")
	splash.queue_free()
	t.queue_free()
# show menu
	showMenu()
	
	if !($Music.is_playing()):
		$Music.play()
		print("play music!")
	
	
func showMenu():
	menuScene = menu.instance()
	add_child(menuScene)
	
	menuScene.scoretext.append_bbcode("[center]" + str(score) + "[/center]")
	
func _showGame():
	score = 0
	menuScene.queue_free()
	gameScene = game.instance()
	add_child(gameScene)
	
	


