extends Node2D

var audio_player
var index = 0
var _code

# Called when the node enters the scene tree for the first time.
func _ready():
	$MorseTimer.connect("timeout", _on_timer_timeout)
	$Button.pressed.connect(_playAudioClicked)
	audio_player = $AudioBeep2D
	_code = $CharsMap.encode("sos")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
# Define a function that runs when the timer times out
func _on_timer_timeout():
	audio_player.stop()
	# Increment the index by one
	index += 1
	# Check if the index is within the bounds of the array
	if index < _code.size():
		# Start the timer with the next interval
		if _code[index].noiseFlag == true:
			audio_player.play()
		$MorseTimer.start(_code[index].length)
	

		
func _playAudioClicked():
	index = 0
	audio_player.play()
	$MorseTimer.start(_code[0].length)
	print(_code[0].length)
