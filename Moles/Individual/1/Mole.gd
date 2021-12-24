extends Control

var sprite = load("res://Moles/Sprites/" + GlobalVar.animal + "/1.png")



# Called when the node enters the scene tree for the first time.
func _ready():
	get_child(0).texture = sprite
