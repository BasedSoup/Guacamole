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
func SaveFile(content):
	var usernamesFile = File.new()
#	usernamesFile.open("user://save_game.dat", File.WRITE)
	usernamesFile.open("N:/GuacamoleCFG/save_game.dat", File.WRITE)
	usernamesFile.store_string(content)
	usernamesFile.close()

func _pressed():
	JSON.print(SaveFile(get_parent().get_child(1).text))
	#sets the save file contents to the contents of the text editor
