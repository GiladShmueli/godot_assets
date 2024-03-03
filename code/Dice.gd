extends Node2D

var sidesNum = 6
var face = null
var rng = RandomNumberGenerator.new()
var locked = false

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.seed = Time.get_ticks_msec()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func randSide():
	if !locked:
		face = rng.randi_range(1, sidesNum)
		var img = "res://images/dice_" + str(face) + ".png"
		#$SideUp.set_texture(preload(img))
		$SideUp.texture = load(img)

func lockDice():
	locked = true
	
	
func _input(event):
   # Mouse in viewport coordinates.
	if event is InputEventMouseButton && event.button_index == MouseButton.MOUSE_BUTTON_LEFT && event.is_pressed() == false:
		randSide()
		
	elif event is InputEventMouseMotion:
		pass #print("Mouse Motion at: ", event.position)
