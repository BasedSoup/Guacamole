extends Node2D


func _ready():
	print(GlobalVar.user)
	get_child(1).text = str(LoadFile()["Users"][GlobalVar.user]["Points"]) + (' Points')
	get_child(2).text = ("Welcome!\n") + str(LoadFile()["Users"][GlobalVar.user]["Username"])
	
func LoadFile():
	var usernamesFile = File.new()
	usernamesFile.open("N:/GuacamoleCFG/save_game.dat", File.READ)
#	usernamesFile.open("user://save_game.dat", File.READ)
	var content = JSON.parse(usernamesFile.get_as_text()).result
	usernamesFile.close()
	return content




func _on_Moles_pressed():
	pass # Replace with function body.


func _on_Minigames_pressed():
	get_tree().change_scene("res://Scenes/Minigames.tscn")
	pass # Replace with function body.
