
class_name ClueItem

enum CLUE_TYPE {NAME, SYMBOL, FACE}

enum CLUE_NAME {
	NONE,
	ALBERT, ALYSSA, AURORA, BURLEY, CLAUDIUS, CULPEPPER, DANE, EIFFEL, FONTAINE, GILDEROY, GRAVES,
	HOUDINI, HUGO, ISOLDE, JACE, JULIET, KATHERINE, LANSING, LEONA, LOCKHART, MONTGOMERY, PHILIP,
	REGINA, ROBERT, STERLING, TOM, TRISTAN,
	FARNSWORTH, GLOVER, HARDIN, WARMBLOOD
}

enum CLUE_SYMBOL {
	NONE,
	APPLE, BROWN_HORSE, CLOCK_0, CLOCK_10, CLOCK_12, CLOCK_2, CLOCK_4, CLOCK_6,
	CLOCK_8, DRIFTWOOD, FIRE, FISH, GOLD, HEART, LARGE_BLACK_HORSE,
	LIGHTNING_BOLT, LUTE, MOON, RAIN, RED_HORSE, ROSE, ROSE_SIGIL, RUBY,
	SMALL_BLACK_HORSE, SMOKE, SMOKING_SKULL, STABLED_WHITE_HORSE, SUGAR_CUBE,
	SUNRISE, SUNSET, WHITE_HORSE, RASPBERRY, STRAWBERRY
}

enum CLUE_FACE {
	NONE,
	ALBERT, ALYSSA, FONTAINE, GILDEROY, LEONA, PHILIP, ROBERT, TOM,
}

var clue_name_display_names = {
	CLUE_NAME.ALBERT: "Albert",
	CLUE_NAME.ALYSSA: "Alyssa",
	CLUE_NAME.AURORA: "Aurora",
	CLUE_NAME.BURLEY: "Burley",
	CLUE_NAME.CLAUDIUS: "Claudius",
	CLUE_NAME.CULPEPPER: "Culpepper",
	CLUE_NAME.DANE: "Dane",
	CLUE_NAME.EIFFEL: "Eiffel",
	CLUE_NAME.FONTAINE: "Fontaine",
	CLUE_NAME.GILDEROY: "Gilderoy",
	CLUE_NAME.GRAVES: "Graves",
	CLUE_NAME.HOUDINI: "Houdini",
	CLUE_NAME.HUGO: "Hugo",
	CLUE_NAME.ISOLDE: "Isolde",
	CLUE_NAME.JACE: "Jace",
	CLUE_NAME.JULIET: "Juliet",
	CLUE_NAME.KATHERINE: "Katherine",
	CLUE_NAME.LANSING: "Lansing",
	CLUE_NAME.LEONA: "Leona",
	CLUE_NAME.LOCKHART: "Lockhart",
	CLUE_NAME.MONTGOMERY: "Montgomery",
	CLUE_NAME.PHILIP: "Philip",
	CLUE_NAME.REGINA: "Regina",
	CLUE_NAME.ROBERT: "Robert",
	CLUE_NAME.STERLING: "Sterling",
	CLUE_NAME.TOM: "Tom",
	CLUE_NAME.TRISTAN: "Tristan",
	CLUE_NAME.FARNSWORTH: "Farnsworth",
	CLUE_NAME.GLOVER: "Glover",
	CLUE_NAME.HARDIN: "Hardin",
	CLUE_NAME.WARMBLOOD: "Warmblood",
	CLUE_NAME.NONE: "NON_NAME_TYPE_CLUE",
}

var clue_symbol_resource_paths = {
	CLUE_SYMBOL.APPLE: "APPLE",
	CLUE_SYMBOL.BROWN_HORSE: "BROWN_HORSE",
	CLUE_SYMBOL.CLOCK_0: "CLOCK_0",
	CLUE_SYMBOL.CLOCK_10: "CLOCK_10",
	CLUE_SYMBOL.CLOCK_12: "CLOCK_12",
	CLUE_SYMBOL.CLOCK_2: "CLOCK_2",
	CLUE_SYMBOL.CLOCK_4: "CLOCK_4",
	CLUE_SYMBOL.CLOCK_6: "CLOCK_6",
	CLUE_SYMBOL.CLOCK_8: "CLOCK_8",
	CLUE_SYMBOL.DRIFTWOOD: "DRIFTWOOD",
	CLUE_SYMBOL.FIRE: "FIRE",
	CLUE_SYMBOL.FISH: "FISH",
	CLUE_SYMBOL.GOLD: "GOLD",
	CLUE_SYMBOL.HEART: "HEART",
	CLUE_SYMBOL.LARGE_BLACK_HORSE: "LARGE_BLACK_HORSE",
	CLUE_SYMBOL.LIGHTNING_BOLT: "LIGHTNING_BOLT",
	CLUE_SYMBOL.LUTE: "LUTE",
	CLUE_SYMBOL.MOON: "MOON",
	CLUE_SYMBOL.RAIN: "RAIN",
	CLUE_SYMBOL.RED_HORSE: "RED_HORSE",
	CLUE_SYMBOL.ROSE: "ROSE",
	CLUE_SYMBOL.ROSE_SIGIL: "ROSE_SIGIL",
	CLUE_SYMBOL.RUBY: "RUBY",
	CLUE_SYMBOL.SMALL_BLACK_HORSE: "SMALL_BLACK_HORSE",
	CLUE_SYMBOL.SMOKE: "SMOKE",
	CLUE_SYMBOL.SMOKING_SKULL: "SMOKING_SKULL",
	CLUE_SYMBOL.STABLED_WHITE_HORSE: "STABLED_WHITE_HORSE",
	CLUE_SYMBOL.SUGAR_CUBE: "SUGAR_CUBE",
	CLUE_SYMBOL.SUNRISE: "SUNRISE",
	CLUE_SYMBOL.SUNSET: "SUNSET",
	CLUE_SYMBOL.WHITE_HORSE: "WHITE_HORSE",
	CLUE_SYMBOL.RASPBERRY: "RASPBERRY",
	CLUE_SYMBOL.STRAWBERRY: "STRAWBERRY",
	CLUE_SYMBOL.NONE: "NON_SYMBOL_TYPE_CLUE"
}

var type: CLUE_TYPE
var value: String
var name_value: CLUE_NAME
var symbol_value: CLUE_SYMBOL
var face_value: CLUE_FACE

func _init(
		clue_type = CLUE_TYPE.NAME,
		clue_name_value: CLUE_NAME = CLUE_NAME.NONE,
		clue_symbol_value: CLUE_SYMBOL = CLUE_SYMBOL.NONE,
		clue_face_value: CLUE_FACE = CLUE_FACE.NONE
	):
	type = clue_type
	name_value = clue_name_value
	symbol_value = clue_symbol_value
	face_value = clue_face_value
	#value = clue_value

func getClueNameDisplayValue():
	return clue_name_display_names.get(name_value)
	#return clue_name_display_names[name_value]

func getClueSymbolResourcePath():
	return clue_symbol_resource_paths.get(symbol_value)
	#return clue_symbol_resource_paths[symbol_value]

func getClueDebugValue():
	if (type == ClueItem.CLUE_TYPE.NAME):
		return getClueNameDisplayValue()
	elif (type == ClueItem.CLUE_TYPE.SYMBOL):
		return getClueSymbolResourcePath()
	elif (type == ClueItem.CLUE_TYPE.FACE):
		return face_value

func isSameClue(clue_item_to_compare: ClueItem):
	var clue_item_types_match = clue_item_to_compare.type == type
	if (clue_item_types_match == false):
		return false
	
	if (type == ClueItem.CLUE_TYPE.NAME):
		return name_value == clue_item_to_compare.name_value
	elif (type == ClueItem.CLUE_TYPE.SYMBOL):
		return symbol_value == clue_item_to_compare.symbol_value
	elif (type == ClueItem.CLUE_TYPE.FACE):
		return face_value == clue_item_to_compare.face_value
