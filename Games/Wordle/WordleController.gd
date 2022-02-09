extends Control

var rng = RandomNumberGenerator.new()
var word = 0
var letter = 1

func _ready():
	rng.randomize()
	var randomWordLimited = File.new()
	var wordListFile = File.new()
	randomWordLimited.open("res://Games/Wordle/words-simple.dic", File.READ)
	wordListFile.open("res://Games/Wordle/words.dic", File.READ)
	var randomWordList = randomWordLimited.get_as_text().split("\n")
	var randomWord = randomWordList[rng.randi() % randomWordList.size() - 1]
	print(randomWord)
	randomWordLimited.close()
	
	var WordList = wordListFile.get_as_text().split("\n")
	
func _input(event):
	if event is InputEventKey and event.pressed and not event.echo:
		match event.scancode:
			KEY_ENTER:
				print(get_child(word).get_child(letter).get_child(0).name)
			KEY_BACKSPACE:
				if letter != 0:
					letter -= 1
					get_child(word).get_child(letter).get_child(0).text == ""
			KEY_ESCAPE:
				get_tree().change_scene("res://Scenes/Minigames.tscn")
			KEY_A:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text == "A"
					letter += 1
