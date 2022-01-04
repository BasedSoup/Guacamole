extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.


func _on_WhackaMoleButton_pressed():
	get_tree().change_scene("res://Games/WhackAMole/WhackAMole.tscn")


func _on_TileMatchButton_pressed():
	get_tree().change_scene("res://Games/TileMatch/TileMatch.tscn")

func _input(event):
	if event.is_action_pressed("back"):
		get_tree().change_scene("res://Scenes/Main.tscn")

func _ready():
	for mole in GlobalVar.LoadFile()['Users'][GlobalVar.user]['Moles']:
		if mole['Happy']:
			self.get_child(1).get_child(0).visible = true
