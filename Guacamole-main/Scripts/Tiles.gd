extends TextureButton


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _pressed():
	if self.texture_normal.resource_path == "res://Mole.jpg":
		self.disabled = true
		GlobalVar.SaveScore(1)
		get_parent().get_parent().get_child(1).text = str(GlobalVar.LoadScore()) + (' Points')

