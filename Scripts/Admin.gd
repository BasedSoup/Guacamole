extends Node2D

func LoadFile():
	var usernamesFile = File.new()
#	usernamesFile.open("user://save_game.dat", File.READ)
	usernamesFile.open(GlobalVar.savePath, File.READ)
	var content = JSON.parse(usernamesFile.get_as_text()).result
	usernamesFile.close()
	return content

func SaveFile(content):
	var usernamesFile = File.new()
#	usernamesFile.open("user://save_game.dat", File.WRITE)
	usernamesFile.open(GlobalVar.savePath, File.WRITE)
	usernamesFile.store_string(content)
	usernamesFile.close()

func loadPressed():
	get_child(1).text = JSON.print(LoadFile(), "\t")
	#sets the contents of the text editor to the contents of the file.

func savePressed():
	JSON.print(SaveFile(get_child(1).text))
	#sets the save file contents to the contents of the text editor

func playPressed():
	get_tree().change_scene("res://Scenes/Main.tscn")

func _input(event):
	if event.is_action_pressed("back"):
		get_tree().change_scene("res://Scenes/Login.tscn")

