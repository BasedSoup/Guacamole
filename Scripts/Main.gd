extends Node2D


func _ready():
	get_child(1).text = str(LoadFile()["Users"][GlobalVar.user]["Points"]) + (' Points')
	get_child(2).text = ("Welcome!\n") + str(LoadFile()["Users"][GlobalVar.user]["Username"])
	
func LoadFile():
	var usernamesFile = File.new()
	usernamesFile.open(GlobalVar.savePath, File.READ)
#	usernamesFile.open("user://save_game.dat", File.READ)
	var content = JSON.parse(usernamesFile.get_as_text()).result
	usernamesFile.close()
	return content




func _on_Moles_pressed():
	get_tree().change_scene("res://Scenes/Moles.tscn")


func _on_Minigames_pressed():
	get_tree().change_scene("res://Scenes/Minigames.tscn")

func _input(event):
	if event.is_action_pressed("back"):
		get_tree().change_scene("res://Scenes/Login.tscn")


func _on_Settings_pressed():
	get_tree().change_scene("res://Scenes/Settings.tscn")
