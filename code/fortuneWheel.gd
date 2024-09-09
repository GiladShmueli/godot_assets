extends Node2D

var slicesNum = 6
var colorCreator = preload("res://code/distinctColors.gd").new()
var colors = colorCreator.generate_distinct_colors(slicesNum, 0.5)

var values = ["a", "b", "c", "d", "e", "f"]

var loaded: bool = false

var lastMousePosition = null

enum eDirection {
	CLOCKWISE = 1,
	COUNTERCLOCKWISE = -1
}

#---------- functions ----------#

func float_array_to_Vector2Array(coords : Array) -> PackedVector2Array:
	# Convert the array of floats into a PackedVector2Array.
	var array : PackedVector2Array = []
	for coord in coords:
		array.append(Vector2(coord[0], coord[1]))
	return array

func _process(_delta):
	spin_the_wheel(_delta)

func _draw():
	# draw wheel 
	var center = Vector2(0, 0)
	var radius = 10
	var slice_angle = 360/slicesNum
	
	for slice in slicesNum:
		var angle_from = slice * slice_angle
		var angle_to = (slice + 1) * slice_angle
		draw_circle_arc_poly(center, radius, angle_from, angle_to, colors[slice])
		var slice_label = Label.new()
		slice_label.text = values[slice]
		slice_label.rotation_degrees = (angle_from + angle_to)/2
		slice_label.position = Vector2(cos(slice_label.rotation - PI/2) * (radius + 1), sin(slice_label.rotation - PI/2) * (radius + 1))
		slice_label.scale = Vector2(0.3,0.3)
		self.add_child(slice_label)
	
	loaded = true


func draw_circle_arc_poly(center, radius, angle_from, angle_to, color):
	var nb_points = 32
	var points_arc = PackedVector2Array()
	points_arc.push_back(center)
	var colors = PackedColorArray([color])
	
	for i in range(nb_points + 1):
		var angle_point = deg_to_rad(angle_from + i * (angle_to - angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	draw_polygon(points_arc, colors)


func spin_the_wheel(delta):
	if(loaded):
		#print(delta)
		#rotation += delta
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			var mousePosition = get_global_mouse_position()
			if(lastMousePosition == null):
				lastMousePosition = mousePosition
			var direction = eDirection.CLOCKWISE
			if abs(mousePosition.x - lastMousePosition.x) > abs(mousePosition.y - lastMousePosition.y):
				if mousePosition.x - lastMousePosition.x < 0:
					print("x inner")
					direction = eDirection.COUNTERCLOCKWISE
			else: if mousePosition.y - lastMousePosition.y < 0:
				print("y inner")
				direction = eDirection.COUNTERCLOCKWISE
				
			rotation += direction * delta * lastMousePosition.distance_to(mousePosition)
			lastMousePosition = mousePosition
			
