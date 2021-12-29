extends Node2D

var animals = ["Moles", "Sharks", "Lorries"]

# Called when the node enters the scene tree for the first time.
func _ready():
	get_child(1).get_child(0).value = GlobalVar.volume
	get_child(2).get_child(0).text = GlobalVar.animal


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Volume_value_changed(volume):
	var file = GlobalVar.LoadFile()
	file["Users"][GlobalVar.user]["Settings"]["Volume"] = volume
	GlobalVar.SaveFile(JSON.print(file))
	GlobalVar.volume = volume

func _input(event):
	if event.is_action_pressed("back"):
		get_tree().change_scene("res://Scenes/Main.tscn")


func _on_Animal_pressed():
	var selAnimal
	for animal in range(len(animals)):
		if get_child(2).get_child(0).text == animals[animal]:
			if animal == len(animals) - 1:
				selAnimal = animals[0]
				get_child(2).get_child(0).text = selAnimal
			else:
				selAnimal = animals[animal + 1]
				get_child(2).get_child(0).text = selAnimal
			var file = GlobalVar.LoadFile()
			file["Users"][GlobalVar.user]["Settings"]["Animal"] = selAnimal
			GlobalVar.SaveFile(JSON.print(file))
			GlobalVar.animal = selAnimal
			return
