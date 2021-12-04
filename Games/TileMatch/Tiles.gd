extends Control

var types = [2,2,2,2,2,2]
var clicked = []
var clicks = 0
var totalScore = 100
var tile0 = preload("res://Games/TileMatch/Tiles/0.png")
var tile1 = preload("res://Games/TileMatch/Tiles/1.png")
var tile2 = preload("res://Games/TileMatch/Tiles/2.png")
var tile3 = preload("res://Games/TileMatch/Tiles/3.png")
var tile4 = preload("res://Games/TileMatch/Tiles/4.png")
var tile5 = preload("res://Games/TileMatch/Tiles/5.png")
var active = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if len(clicked) >= 2:
			if active:
				return
			active = true
			yield(get_tree().create_timer(2.0), "timeout")
			print(len(clicked))
			var button0 = get_node(clicked[0])
			var button1 = get_node(clicked[1])
			if clicked[0] != null:
				if get_node(clicked[0]).Assigned != get_node(clicked[1]).Assigned:
					button0.disabled = false
					button1.disabled = false
					totalScore -= 25
				clicked.pop_front()
				clicked.pop_front()
		active = false

func _ready():
	GlobalVar.connect("tilePressed", self, "buttonPressed")
	var rng = RandomNumberGenerator.new()
	var tiles = get_child_count()
	var unique = tiles/2
	for childNo in range(0,tiles):
		var unassigned = true
		while unassigned:
			rng.randomize()
			var number = rng.randi_range(0,unique-1)
			if types[number] > 0:
				get_child(childNo).Assigned = number
				get_child(childNo).texture_disabled = tileGen(number)
				types[number] -= 1
				unassigned = false
					
			

func buttonPressed(buttonName):
	if len(clicked) < 2:
		var button = get_node(buttonName)
		button.disabled = true
		clicked.append(buttonName)

		
	
func tileGen(tileNumber):
	if tileNumber == 0:
		return tile0
	elif tileNumber == 1:
		return tile1
	elif tileNumber == 2:
		return tile2
	elif tileNumber == 3:
		return tile3
	elif tileNumber == 4:
		return tile4
	elif tileNumber == 5:
		return tile5
