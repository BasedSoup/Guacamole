extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var user

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func LoadScore():
	return LoadFile()["Users"][GlobalVar.user]["Points"]
	
func SaveScore(points):
	var newFile = LoadFile()
	newFile["Users"][GlobalVar.user]["Points"] += points
	SaveFile(JSON.print(newFile))
	
func SaveFile(content):
	var usernamesFile = File.new()
	usernamesFile.open("N:/GuacamoleCFG/save_game.dat", File.WRITE)
#	usernamesFile.open("user://save_game.dat", File.WRITE)
	usernamesFile.store_string(content)
	usernamesFile.close()
	#function for loading files
func LoadFile():
	var usernamesFile = File.new()
	usernamesFile.open("N:/GuacamoleCFG/save_game.dat", File.READ)
#	usernamesFile.open("user://save_game.dat", File.READ)
	var content = JSON.parse(usernamesFile.get_as_text()).result
	usernamesFile.close()
	return content


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
