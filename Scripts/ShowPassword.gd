extends Button

var password = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _pressed():
	password = get_parent().get_child(3).secret
	if password == false:
		get_parent().get_child(3).secret = true
		self.text = "Show Password"
	else:
		get_parent().get_child(3).secret = false
		self.text = "Hide Password"
		
