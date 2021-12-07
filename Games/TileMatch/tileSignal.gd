extends TextureButton

export (int) var Assigned # Assigns a variable to all buttons within the minigame

func _pressed():
	GlobalVar.emit_signal("tilePressed", self.name) # Tells the tile manager script the tile has been selected
