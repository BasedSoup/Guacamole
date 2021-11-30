extends TextureButton

func _ready():
	yield(get_tree().create_timer(15.0),"timeout") #Creates a timer to indicate when the game will end
	get_tree().change_scene("res://Scenes/Main.tscn") #Ends game
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var randomNumber = randi() %1001 #0.5% chance that the tile will appear/disappear
	if randomNumber <= 5:
		self.disabled = true #hides mole
	if randomNumber >= 995:
		self.disabled = false #shows mole
		
	

func _pressed(): #registers mouse interaction with mole
	if self.disabled == false:
		self.disabled = true #if mole is shown then hide
		GlobalVar.SaveScore(1) # increase score
		get_parent().get_parent().get_child(1).text = str(GlobalVar.LoadScore()) + (' Points')

