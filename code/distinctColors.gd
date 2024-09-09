extends Node


func generate_distinct_colors(num: int, threshold: float, saturation: Vector2 = Vector2(0.6, 1), lightness: Vector2 = Vector2(0.25, 0.75)):
	var colors = []
	while len(colors) < num:
		var new_color: Color = generate_random_hsl_color(saturation, lightness)
		var flag = true
		#if colors.all(distance(new_color, c) > threshold for c in colors):
		for x in colors:
			if distance(x, new_color) < threshold: #&& \
			#new_color.s >= saturation.x && new_color.s <= saturation.y && \
			#new_color.v >= value.x && new_color.v <= value.y:
				flag = false
		if flag == true:
			colors.append(new_color)
			#print(new_color.h, " ", new_color.s, " ", new_color.v)
	return colors

func generate_random_hsl_color(saturation: Vector2 = Vector2(0.6, 1), lightness: Vector2 = Vector2(0.25, 0.75)) -> Color:
	# Generate a color in the desired color space
	return Color.from_ok_hsl(randf_range(0, 1), randf_range(saturation.x, saturation.y), randf_range(lightness.x, lightness.y))

func distance(color1, color2):
	# Calculate the distance between two colors
	return sqrt(pow(color1.r - color2.r, 2) + pow(color1.g - color2.g, 2) + pow(color1.b - color2.b,2))

# Usage
#var distinct_colors = generate_distinct_colors(10, 0.5)
#print(distinct_colors)
