extends Node

#var ref = { 
#    'a': '.-',
#    'b': '-...',
#    'c': '-.-.',
#    'd': '-..',
#    'e': '.',
#    'f': '..-.',
#    'g': '--.',
#    'h': '....',
#    'i': '..',
#    'j': '.---',
#    'k': '-.-',
#    'l': '.-..',
#    'm': '--',
#    'n': '-.',
#    'o': '---',
#    'p': '.--.',
#    'q': '--.-',
#    'r': '.-.',
#    's': '...',
#    't': '-',
#    'u': '..-',
#    'v': '...-',
#    'w': '.--',
#    'x': '-..-',
#    'y': '-.--',
#    'z': '--..',
#    '1': '.----',
#    '2': '..---',
#    '3': '...--',
#    '4': '....-',
#    '5': '.....',
#    '6': '-....',
#    '7': '--...',
#    '8': '---..',
#    '9': '----.',
#    '0': '-----',
#  };

class BeepInfo:
	var length
	var noiseFlag
	
	func _init(ln, noise):
		length = ln
		noiseFlag = noise


var dot = 		BeepInfo.new(0.3, true) 			# Dot (.): This is the basic unit of time in Morse code, typically lasting for one unit.
var bSpacer = 	BeepInfo.new(0.2, false) 		# Space between parts of the same letter: This space is one unit of time.	
var lwSpacer = 	BeepInfo.new(0.8, false) 		# Space between letters in the same word: This space is three units of time. Used extra when space
var dash = 		BeepInfo.new(0.9, true) 			# Dash (-): A dash is equivalent to three units of time.


var abcToMorse = {
	"0": [ dash, bSpacer, dash, bSpacer, dash, bSpacer, dash, bSpacer, dash, bSpacer],
	"1": [ dot, bSpacer, dash, bSpacer, dash, bSpacer, dash, bSpacer, dash, bSpacer],
	"2": [ dot, bSpacer, dot, bSpacer, dash, bSpacer, dash, bSpacer, dash, bSpacer],
	"3": [ dot, bSpacer, dot, bSpacer, dot, bSpacer, dash, bSpacer, dash, bSpacer],
	"4": [ dot, bSpacer, dot, bSpacer, dot, bSpacer, dot, bSpacer, dash, bSpacer],
	"5": [ dot, bSpacer, dot, bSpacer, dot, bSpacer, dot, bSpacer, dot, bSpacer],
	"6": [ dash, bSpacer, dot, bSpacer, dot, bSpacer, dot, bSpacer, dot, bSpacer],
	"7": [ dash, bSpacer, dash, bSpacer, dot, bSpacer, dot, bSpacer, dot, bSpacer],
	"8": [ dash, bSpacer, dash, bSpacer, dash, bSpacer, dot, bSpacer, dot, bSpacer],
	"9": [ dash, bSpacer, dash, bSpacer, dash, bSpacer, dash, bSpacer, dot, bSpacer],
	"a": [ dot, bSpacer, dash, bSpacer],
	"b": [ dash, bSpacer, dot, bSpacer, dot, bSpacer, dot, bSpacer],
	"c": [ dash, bSpacer, dot, bSpacer, dash, bSpacer, dot, bSpacer],
	"d": [ dash, bSpacer, dot, bSpacer, dot, bSpacer],
	"e": [ dot, bSpacer],
	"f": [ dot, bSpacer, dot, bSpacer, dash, bSpacer, dot, bSpacer],
	"g": [ dash, bSpacer, dash, bSpacer, dot, bSpacer],
	"h": [ dot, bSpacer, dot, bSpacer, dot, bSpacer, dot, bSpacer],
	"i": [ dot, bSpacer, dot, bSpacer],
	"j": [ dot, bSpacer, dash, bSpacer, dash, bSpacer, dash, bSpacer],
	"k": [ dash, bSpacer, dot, bSpacer, dash, bSpacer],
	"l": [ dot, bSpacer, dash, bSpacer, dot, bSpacer, dot, bSpacer],
	"m": [ dash, bSpacer, dash, bSpacer],
	"n": [ dash, bSpacer, dot, bSpacer],
	"o": [ dash, bSpacer, dash, bSpacer, dash, bSpacer],
	"p": [ dot, bSpacer, dash, bSpacer, dash, bSpacer, dot, bSpacer],
	"q": [ dash, bSpacer, dash, bSpacer, dot, bSpacer, dash, bSpacer],
	"r": [ dot, bSpacer, dash, bSpacer, dot, bSpacer],
	"s": [ dot, bSpacer, dot, bSpacer, dot, bSpacer],
	"t": [ dash, bSpacer],
	"u": [ dot, bSpacer, dot, bSpacer, dash, bSpacer],
	"v": [ dot, bSpacer, dot, bSpacer, dot, bSpacer, dash, bSpacer],
	"w": [ dot, bSpacer, dash, bSpacer, dash, bSpacer],
	"x": [ dash, bSpacer, dot, bSpacer, dot, bSpacer, dash, bSpacer],
	"y": [ dash, bSpacer, dot, bSpacer, dash, bSpacer, dash, bSpacer],
	"z": [ dash, bSpacer, dash, bSpacer, dot, bSpacer, dot, bSpacer],
	" ": [ lwSpacer]
}



# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func encode(myStr):
	var resultCode = []
	
	for c in myStr:
		resultCode.append_array(abcToMorse[c])
		resultCode.append(lwSpacer)
		
	return resultCode
