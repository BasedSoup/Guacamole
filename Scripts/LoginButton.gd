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
	if LoadFile() == null:
		SaveFile('{"Users":[]}')

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _pressed():
	username = get_child(1).text
	password = get_child(3).text
#	print(username + "\n" + password)
	var usersJSON = LoadFile()
	var counter = 0
	for each in usersJSON["Users"]:
		if each["Username"] == username:
			if each["Password"] == password:
				if username == "Admin":
					get_tree().change_scene("res://Scenes/Admin.tscn")
					return
				GlobalVar.user = counter
				get_tree().change_scene("res://Scenes/Main.tscn")
				return
			get_parent().get_child(1).text="Incorrect Password"
			return
		counter += 1
		
	get_parent().get_child(1).text="New Account Created"
	newFile = LoadFile()
	newFile["Users"].append({"Username":username, "Password":password, "Points":0})
	print(newFile)
	SaveFile(JSON.print(newFile))

func SaveFile(content):
	var usernamesFile = File.new()
	usernamesFile.open("N:/GuacamoleCFG/save_game.dat", File.WRITE)
#	usernamesFile.open("user://save_game.dat", File.WRITE)
	usernamesFile.store_string(content)
	usernamesFile.close()
	
func LoadFile():
	var usernamesFile = File.new()
	usernamesFile.open("N:/GuacamoleCFG/save_game.dat", File.READ)
#	usernamesFile.open("user://save_game.dat", File.READ)
	var content = JSON.parse(usernamesFile.get_as_text()).result
	usernamesFile.close()
	return content
