extends Node2D


func _ready():
	print(GlobalVar.user)
	get_child(1).text = str(LoadFile()["Users"][GlobalVar.user]["Points"])
	
func LoadFile():
	var usernamesFile = File.new()
	usernamesFile.open("N:/GuacamoleCFG/save_game.dat", File.READ)
#	usernamesFile.open("user://save_game.dat", File.READ)
	var content = JSON.parse(usernamesFile.get_as_text()).result
	usernamesFile.close()
	return content
