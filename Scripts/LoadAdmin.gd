extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func LoadFile():
	var usernamesFile = File.new()
#	usernamesFile.open("user://save_game.dat", File.READ)
	usernamesFile.open("N:/GuacamoleCFG/save_game.dat", File.READ)
	var content = JSON.parse(usernamesFile.get_as_text()).result
	usernamesFile.close()
	return content

func _pressed():
	get_parent().get_child(1).text = JSON.print(LoadFile())
