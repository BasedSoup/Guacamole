extends Control

var moleNumber = GlobalVar.selectedMole # Loads the sprite for the mole character
var sprite = load("res://Moles/Sprites/" + GlobalVar.animal + "/"+str(moleNumber)+".png")


var saveFile = GlobalVar.LoadFile()
var moleData = saveFile["Users"][GlobalVar.user]["Moles"][moleNumber - 1]

# Called when the node enters the scene tree for the first time.
func _ready():
	get_child(0).texture = sprite # Creates the multiple choice section of the mole part of the solution
	get_child(1).text = moleData["Name"]
	get_child(2).text = moleData["Problem"]["Answers"][0]
	get_child(3).text = moleData["Problem"]["Answers"][1]
	get_child(4).text = moleData["Problem"]["Answers"][2]
	get_child(5).text = moleData["Problem"]["Question"]

func _input(event):
	if event.is_action_pressed("back"):
		get_tree().change_scene("res://Scenes/Moles.tscn")




func _ButtonPressed(answer): # Checks if the correct answer has been clicked
	if moleData["Problem"]["CorrectAnswer"] == answer:
		saveFile["Users"][GlobalVar.user]["Moles"][moleNumber - 1]["Happy"] = true
	else:
		saveFile["Users"][GlobalVar.user]["Moles"][moleNumber - 1]["Unlocked"] = false
	GlobalVar.SaveFile(JSON.print(saveFile))
	get_tree().change_scene("res://Scenes/Moles.tscn")
