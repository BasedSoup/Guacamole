extends Control

var types = [2,2,2,2,2,2,2,2,2,2,2,2]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _ready():
	GlobalVar.connect("tilePressed", self, "buttonPressed")
	var rng = RandomNumberGenerator.new()
	var tiles = get_child_count()
	var unique = tiles/2
	print(tiles)
	for childNo in range(0,tiles):
		var unassigned = true
		while unassigned:
			rng.randomize()
			var number = rng.randi_range(0,unique-1)
			if types[number] > 0:
				get_child(childNo).Assigned = number
				print(types)
				types[number] -= 1
				print(types)
				unassigned = false
					
			

func buttonPressed(buttonName):
	print(buttonName)
