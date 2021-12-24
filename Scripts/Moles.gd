extends Node


var currentFile = GlobalVar.LoadFile()


func _ready():
	for child in range(len(get_children()) - 1):
		if currentFile["Users"][GlobalVar.user]["Moles"][child]["Unlocked"]:
			get_child(child).get_child(2).hide()


func _input(event):
	if event.is_action_pressed("back"):
		get_tree().change_scene("res://Scenes/Main.tscn")
