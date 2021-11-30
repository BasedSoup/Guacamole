extends Button

var password = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
# triggers when show password button is pressed
func _pressed():
	password = get_parent().get_child(3).secret
	if password == false:
		get_parent().get_child(3).secret = true  #shows user password as asterisks
		self.text = "Show Password"
	else:
		get_parent().get_child(3).secret = false  #shows user password as plaintext
		self.text = "Hide Password"
		
