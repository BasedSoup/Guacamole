extends Button

var username = ""
var password = ""
var newFile = ""

# var usersJSON = {"Users":[{"Username":"charlie", "Password":"cheese"}]}
# var usersJSON = {"Users":[]}
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
#	SaveFile(JSON.print(usersJSON))
#Loads the user file at the start to check if it exists, if not it will create one
	if LoadFile() == null:
		SaveFile('{"Users":[]}')

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
#checks if button is pressed

func _input(event):
	if event.is_action_pressed("back"):
		get_tree().quit()
	
	elif event.is_action_pressed("enter"):
		_pressed()

func _pressed():
	#gets user info
	username = get_child(1).text
	password = get_child(3).text
#	print(username + "\n" + password)
#authenticates user by iterating between each entry in the user list
	var usersJSON = LoadFile()
	var counter = 0
	for each in usersJSON["Users"]:
		if each["Username"] == username:
			if each["Password"] == password.sha256_text():
				GlobalVar.user = counter
				GlobalVar.animal = each["Settings"]["Animal"]
				GlobalVar.volume = each["Settings"]["Volume"]
				if username == "Admin":
					#redirects admin to admin page
					get_tree().change_scene("res://Scenes/Admin.tscn")
					return
				#redirects user to main screen
				get_tree().change_scene("res://Scenes/Main.tscn")
				return
			get_parent().get_child(1).text="Incorrect Password"
			return
		counter += 1
		#creates a new user
	get_parent().get_child(1).text="New Account Created"
	newFile = LoadFile()
	newFile["Users"].append({
		"Username":username,
		"Password":password.sha256_text(),
		"Points":0, 
		"Moles":[
			{"Name":"Mole1", "Unlocked":false, "Happy":false, 
				"Problem":{"Question":"Mole1 was found crying because they dropped their ice cream.", "Answers":[
					"Tell them to eat it off the ground",
					"Give them money to buy a new one",
					"Walk away"
				], "CorrectAnswer": 2}},
			{"Name":"Mole2", "Unlocked":false, "Happy":false, 
				"Problem":{"Question":"Mole2 is sat alone in the corner of the classroom during break.","Answers":[
					"Ignore them",
					"Make fun of them for having no friends",
					"Ask them if they would like to play with you"
				], "CorrectAnswer": 3}},
			{"Name":"Mole3", "Unlocked":false, "Happy":false, 
				"Problem":{"Question":"You hear people being mean to Mole3.", "Answers":[
					"Tell a teacher",
					"Do nothing",
					"Say mean things about Mole3 to fit in"
				], "CorrectAnswer": 1}},
			{"Name":"Mole4", "Unlocked":false, "Happy":false, 
				"Problem":{"Question":"Mole4 was messing around and broke the teacher's pen. What should you tell them to do?", "Answers":[
					"Confess to the teacher",
					"Hide the broken pen",
					"Blame it on someone else"
				], "CorrectAnswer": 1}},
			{"Name":"Mole5", "Unlocked":false, "Happy":false, 
				"Problem":{"Question":"Mole5 feels sick, what should you do?", "Answers":[
					"Ignore them, it's not your problem",
					"Stay away, you don't want to catch anything",
					"Find a teacher and ask for help"
				], "CorrectAnswer": 3}},
			{"Name":"Mole6", "Unlocked":false, "Happy":false, 
				"Problem":{"Question":"You win your local football game and the opponents are sad.", "Answers":[
					"Make fun of them and call them rubbish",
					"Tell them they played well",
					"Laugh with your friends from a distance about it"
				], "CorrectAnswer": 2}}
			], "Settings":{"Animal":"Moles", "Volume":1}})
	SaveFile(JSON.print(newFile))
#function for saving files
func SaveFile(content):
	var usernamesFile = File.new()
	usernamesFile.open(GlobalVar.savePath, File.WRITE)
#	usernamesFile.open("user://save_game.dat", File.WRITE)
	usernamesFile.store_string(content)
	usernamesFile.close()
	#function for loading files
func LoadFile():
	var usernamesFile = File.new()
	usernamesFile.open(GlobalVar.savePath, File.READ)
#	usernamesFile.open("user://save_game.dat", File.READ)
	var content = JSON.parse(usernamesFile.get_as_text()).result
	usernamesFile.close()
	return content
