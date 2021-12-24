extends Control

var types = [2,2,2,2,2,2] # Creates the maximum amount of times a tile can be used
var clicked = [] # A list holding which tiles have been selected within a cycle
var clicks = 0 # A counter of how many false clicks have been made to help determine points
var totalScore = 100 # The maximum amount of points a user can gain for efficiency
var tile0 = preload("res://Games/TileMatch/Tiles/0.png") # Load the potential textures for the buttons
var tile1 = preload("res://Games/TileMatch/Tiles/1.png")
var tile2 = preload("res://Games/TileMatch/Tiles/2.png")
var tile3 = preload("res://Games/TileMatch/Tiles/3.png")
var tile4 = preload("res://Games/TileMatch/Tiles/4.png")
var tile5 = preload("res://Games/TileMatch/Tiles/5.png")
var active = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if len(clicked) >= 2: # Checks whether two tiles have been selected
			if active: # Checks whether the tile authentication process is already running
				return
			active = true # Declares that the tile authentication process is being used
			var button0 = get_node(clicked[0]) # Gets the two tile objects that have been selected
			var button1 = get_node(clicked[1])
			if clicked[0] != null: # Checks that the tiles have actually been selected
				if get_node(clicked[0]).Assigned != get_node(clicked[1]).Assigned: # Checks whether the two sprites have the same image
					clicks += 1
					get_parent().get_child(1).text = "Misses: " + str(clicks) # Tells the user how many faults they have made
					yield(get_tree().create_timer(2.0), "timeout") # Gives a two second delay to allow the user to see what their choices were
					button0.disabled = false
					button1.disabled = false # Re-allows the tiles to be selected and hides their sprites
				clicked.pop_front() # Clears the selected buttons
				clicked.pop_front()
				
			finishCheck()
			active = false # Declares the end of the process

func _ready(): # called when the node enters the scene
	
	GlobalVar.connect("tilePressed", self, "buttonPressed")
	var rng = RandomNumberGenerator.new()
	var tiles = get_child_count()
	var unique = tiles/2
	for childNo in range(0,tiles):
		var unassigned = true
		while unassigned:
			rng.randomize()
			var number = rng.randi_range(0,unique-1)
			if types[number] > 0:
				get_child(childNo).Assigned = number
				get_child(childNo).texture_disabled = tileGen(number)
				types[number] -= 1
				unassigned = false
					
			

func buttonPressed(buttonName): # Checks whether a button has been pressed
	if len(clicked) < 2: # Makes sure buttons are not being selected while the authentication is occuring
		var button = get_node(buttonName) 
		button.disabled = true
		clicked.append(buttonName)

		
	
func tileGen(tileNumber): # Associates each tile with what image it should use
	if tileNumber == 0:
		return tile0
	elif tileNumber == 1:
		return tile1
	elif tileNumber == 2:
		return tile2
	elif tileNumber == 3:
		return tile3
	elif tileNumber == 4:
		return tile4
	elif tileNumber == 5:
		return tile5

func finishCheck():
	var tiles = get_child_count()
	for childNo in range(0,tiles):
		if get_child(childNo).disabled == false:
			return # Checks if all tiles are visible and therefore correct
	totalScore -= 10 * clicks # Calculates score of user
	if totalScore < 0:
		totalScore = 0
	GlobalVar.SaveScore(25+totalScore) # Saves user's score using a previously written function
	get_tree().change_scene("res://Scenes/Main.tscn") # Returns to main screen

func _input(event):
	if event.is_action_pressed("back"):
		get_tree().change_scene("res://Scenes/Minigames.tscn")
