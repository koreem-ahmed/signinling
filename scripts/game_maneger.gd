extends Node

var coins = 0

@onready var gem_score: Label = $"../player/gem score"

func add_point():
	coins += 1
	print(coins)
	gem_score.text = str(coins)
	
