extends Control

var rng = RandomNumberGenerator.new()
var word = 0
var letter = 0
var randomWord = ''
var won = false
var correctShader = preload("res://Games/Wordle/Correct.tres")
var incorrectShader = preload("res://Games/Wordle/Incorrect.tres")
var yellowShader = preload("res://Games/Wordle/Yellow.tres")
var wordList

func _ready():
	rng.randomize()
	var randomWordLimited = File.new()
	var wordListFile = File.new()
	randomWordLimited.open("res://Games/Wordle/words-simple.dic", File.READ)
	wordListFile.open("res://Games/Wordle/words.dic", File.READ)
	var randomWordList = randomWordLimited.get_as_text().split("\n")
	randomWord = randomWordList[rng.randi() % randomWordList.size() - 1]
	randomWordLimited.close()
	
	wordList = wordListFile.get_as_text().split("\n")
	
func _input(event):
	if won:
		return
	if event is InputEventKey and event.pressed and not event.echo:
		match event.scancode:
			KEY_ENTER:
				if letter == 5:
					var guessWord = get_child(word).get_child(0).get_child(0).text + get_child(word).get_child(1).get_child(0).text + get_child(word).get_child(2).get_child(0).text + get_child(word).get_child(3).get_child(0).text + get_child(word).get_child(4).get_child(0).text
					if guessWord == randomWord.to_upper():
						won = true
						print("You win")
					if guessWord.to_lower() in wordList:
						var yellows = yellowLettters(toArray(randomWord.to_upper()), toArray(guessWord))
						
						for wordLetter in range(5):
							if get_child(word).get_child(wordLetter).get_child(0).text == randomWord[wordLetter].to_upper():
								get_child(word).get_child(wordLetter).material = correctShader
							else:
								get_child(word).get_child(wordLetter).material = incorrectShader
						for yellowLetter in yellows:
							get_child(word).get_child(yellowLetter).material = yellowShader
						if word < 5:
							word += 1
						else:
							print(randomWord)
							won = true
						letter = 0
			KEY_BACKSPACE:
				if letter != 0:
					letter -= 1
					get_child(word).get_child(letter).get_child(0).text = ""
			KEY_ESCAPE:
				get_tree().change_scene("res://Scenes/Minigames.tscn")
			KEY_A:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "A"
					letter += 1
			KEY_B:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "B"
					letter += 1
			KEY_C:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "C"
					letter += 1
			KEY_D:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "D"
					letter += 1
			KEY_E:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "E"
					letter += 1
			KEY_F:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "F"
					letter += 1
			KEY_G:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "G"
					letter += 1
			KEY_H:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "H"
					letter += 1
			KEY_I:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "I"
					letter += 1
			KEY_J:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "J"
					letter += 1
			KEY_K:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "K"
					letter += 1
			KEY_L:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "L"
					letter += 1
			KEY_M:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "M"
					letter += 1
			KEY_N:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "N"
					letter += 1
			KEY_O:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "O"
					letter += 1
			KEY_P:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "P"
					letter += 1
			KEY_Q:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "Q"
					letter += 1
			KEY_R:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "R"
					letter += 1
			KEY_S:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "S"
					letter += 1
			KEY_T:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "T"
					letter += 1
			KEY_U:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "U"
					letter += 1
			KEY_V:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "V"
					letter += 1
			KEY_W:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "W"
					letter += 1
			KEY_X:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "X"
					letter += 1
			KEY_Y:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "Y"
					letter += 1
			KEY_Z:
				if letter != 5:
					get_child(word).get_child(letter).get_child(0).text = "Z"
					letter += 1

func yellowLettters(inputWord, guessedWord):
	var yellows = []
	for _char in range(5):
		if inputWord[_char] == guessedWord[_char]:
			guessedWord[_char] = '_'
			inputWord[_char] = '-'
	for _char in range(5):
		for character in range(5):
			if guessedWord[_char] == inputWord[character]:
				yellows.append(_char)
				inputWord[character] = '-'
	return yellows


func toArray(_inp):
	var newArray = []
	for c in _inp:
		newArray.append(c)
	return newArray
