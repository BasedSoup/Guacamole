extends Control

var rng = RandomNumberGenerator.new() # Creates a new seed for randomisation
var word = 0
var letter = 0
var randomWord = ''
var won = false
var correctShader = preload("res://Games/Wordle/Correct.tres")
var incorrectShader = preload("res://Games/Wordle/Incorrect.tres")
var yellowShader = preload("res://Games/Wordle/Yellow.tres")
var wordList

func _ready(): # Sets up the minigame
	rng.randomize()
	var randomWordLimited = File.new() # Generates short and full lists of words
	var wordListFile = File.new()
	randomWordLimited.open("res://Games/Wordle/words-simple.dic", File.READ)
	wordListFile.open("res://Games/Wordle/words.dic", File.READ)
	var randomWordList = randomWordLimited.get_as_text().split("\n")
	# Randomly Selects a word from the short list
	randomWord = randomWordList[rng.randi() % randomWordList.size() - 1]
	randomWordLimited.close()
	 # Outputs the random word for testing
	 # print(randomWord)
	
	# Creates another list of words for using in word authentication
	wordList = wordListFile.get_as_text().split("\n")
	
	
func _input(event): # Triggers every time the user inputs something
	# Checks if the input is a new keypress
	if event is InputEventKey and event.pressed and not event.echo:
		if event.scancode == KEY_ESCAPE: # Checks if escape key is pressed
			# Returns to minigames menu
			get_tree().change_scene("res://Scenes/Minigames.tscn")
		elif won: # Stops the program from responding if the game has finished
			return
		match event.scancode:
			KEY_ENTER: # Checks if enter is pressed
				if letter == 5: # Checks the word is 5 letters long
					# Combines all letters to form the word
					var guessWord = (get_child(word).get_child(0).get_child(0).text
					+ get_child(word).get_child(1).get_child(0).text
					+ get_child(word).get_child(2).get_child(0).text
					+ get_child(word).get_child(3).get_child(0).text
					+ get_child(word).get_child(4).get_child(0).text)
					if guessWord == randomWord.to_upper(): # Checks if the guess is correct
						won = true # Ends the game
						GlobalVar.SaveScore(10*(10-word)) # Awards points based on performance
						print("You win")
					if guessWord.to_lower() in wordList: # Checks if the word is in the dictionary
						# Converts the word into an array and then checks if there are any yellow letters
						var yellows = yellowLetters(toArray(randomWord.to_upper()), toArray(guessWord))
						
						for wordLetter in range(5): # Iterates through the word and applies the colour to the letters
								# Green letters
								# Checks if a letter is in the correct position
							if get_child(word).get_child(wordLetter).get_child(0).text == randomWord[wordLetter].to_upper():
								get_child(word).get_child(wordLetter).material = correctShader
								alphabetColours(get_child(word).get_child(wordLetter).get_child(0).text, "green")
							else: # Grey (incorrect) letters
								get_child(word).get_child(wordLetter).material = incorrectShader
								alphabetColours(get_child(word).get_child(wordLetter).get_child(0).text, "green")
						for yellowLetter in yellows: # Yellow letters
							get_child(word).get_child(yellowLetter).material = yellowShader
							alphabetColours(get_child(word).get_child(yellowLetter).get_child(0).text, "green")
						if word < 5: # Checks that there are still available guesses
							word += 1
						else: # Ends game if maximum guesses are made
							get_child(8).text = randomWord.to_upper()
							won = true
						letter = 0
			#Removing Letters
			KEY_BACKSPACE: # Checks if the backspace key has been pressed
				if letter != 0: # If there are any remaining letters in the word
					letter -= 1 # Selects previous letter
					# Removed selected letter
					get_child(word).get_child(letter).get_child(0).text = ""
			KEY_A: # Checks if the letter pressed is A
				if letter != 5: # Checks that the word is not already 5 letters long
					# Sets the next letter to A
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

func yellowLetters(inputWord, guessedWord): # Checks if a letter should be yellow
	var yellows = []
	for _char in range(5): # Iterates through each letter
		if inputWord[_char] == guessedWord[_char]: # Removes all green letters
			guessedWord[_char] = '_'
			inputWord[_char] = '-'
	for _char in range(5): # Checks if any letters are in the other word
		for inputChar in range(5):
			if guessedWord[_char] == inputWord[inputChar]:
				yellows.append(_char) # Add to the yellows array
				inputWord[inputChar] = '-' # Removes the confirmed yellow letter
	return yellows


func toArray(_inp): #Converts string to array
	var newArray = []
	for c in _inp: # Iterates through a string
		newArray.append(c) # Appends each letter to a new array
	return newArray
	
func alphabetColours(_let, _colour): # Changes colours of letters in the alphabet
	get_child(7).get_node(_let) # Selects the correct letter
	match _colour: # Changes colour of letter based on parameter
		"grey": # Does not change the colour of any yellow or green letters
			if get_child(7).get_node(_let).material == null:
				get_child(7).get_node(_let).material = incorrectShader
		"yellow":  # Does not change any green letters
			if get_child(7).get_node(_let).material != correctShader:
				get_child(7).get_node(_let).material = yellowShader
		"green":
			get_child(7).get_node(_let).material = correctShader
		
