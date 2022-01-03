extends Node

var sprites = [ # Loads each mole's sprites
	load("res://Moles/Sprites/" + GlobalVar.animal + "/1.png"),
	load("res://Moles/Sprites/" + GlobalVar.animal + "/2.png"),
	load("res://Moles/Sprites/" + GlobalVar.animal + "/3.png"),
	load("res://Moles/Sprites/" + GlobalVar.animal + "/4.png"),
	load("res://Moles/Sprites/" + GlobalVar.animal + "/5.png"),
	load("res://Moles/Sprites/" + GlobalVar.animal + "/6.png")
	]


var currentFile = GlobalVar.LoadFile()


func _ready(): # Shows which moles are unlocked and which moles are happy
	for child in range(len(get_children()) - 2):
		if currentFile["Users"][GlobalVar.user]["Moles"][child]["Unlocked"]:
			get_child(child).get_child(2).hide()
		if currentFile["Users"][GlobalVar.user]["Moles"][child]["Happy"]:
			get_child(child).get_child(3).show()
		get_child(child).get_child(1).texture = sprites[child]
	get_child(7).text = str(GlobalVar.LoadScore()) + " Points"
		


func _input(event): # Allows the user to press Escape to go back
	if event.is_action_pressed("back"):
		get_tree().change_scene("res://Scenes/Main.tscn")

func _on_Button_pressed(moleNumber): # Allows the user to unlock a new mole using the points they have collected
	if get_child(moleNumber-1).get_child(3).visible == false:
		if get_child(moleNumber-1).get_child(2).visible == true:
			if GlobalVar.LoadScore() >= 30:
				currentFile["Users"][GlobalVar.user]["Moles"][moleNumber - 1]["Unlocked"] = true
				currentFile["Users"][GlobalVar.user]["Points"] -= 30
				GlobalVar.SaveFile(JSON.print(currentFile))
				get_child(7).text = str(GlobalVar.LoadScore()) + " Points"
				get_child(moleNumber - 1).get_child(2).hide()
				
				
		else:
			GlobalVar.selectedMole = moleNumber # Switches to the page containing the mole
			get_tree().change_scene("res://Moles/Individual/Mole.tscn")
			
