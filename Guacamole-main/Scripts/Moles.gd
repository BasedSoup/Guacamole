extends TextureButton

func _ready():
	yield(get_tree().create_timer(15.0),"timeout")
	get_tree().change_scene("res://Scenes/Main.tscn")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var randomNumber = randi() %1001
	if randomNumber <= 5:
		self.disabled = true
	if randomNumber >= 995:
		self.disabled = false
		
	

func _pressed():
	if self.texture_normal.resource_path == "res://Mole.jpg":
		self.disabled = true
		GlobalVar.SaveScore(1)
		get_parent().get_parent().get_child(1).text = str(GlobalVar.LoadScore()) + (' Points')

