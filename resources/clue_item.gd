
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

static var clue_type_colors = {
	CLUE_TYPE.NAME: Color.html("#9BB7DF"),
	CLUE_TYPE.SYMBOL: Color.html("#C77DBF"),
	"BOTH": Color.html("#9179B4"),
}

static var clue_type_drop_groups = {
	CLUE_TYPE.NAME: "droppable_name",
	CLUE_TYPE.SYMBOL: "droppable_symbol",
	CLUE_TYPE.FACE: "droppable_face",
}

var clue_name_display_text = {
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

var clue_symbol_display_text = {
	CLUE_SYMBOL.APPLE: "Apple",
	CLUE_SYMBOL.BROWN_HORSE: "Brown horse",
	CLUE_SYMBOL.CLOCK_0: "Midnight",
	CLUE_SYMBOL.CLOCK_10: "Ten o'clock",
	CLUE_SYMBOL.CLOCK_12: "Noon",
	CLUE_SYMBOL.CLOCK_2: "Two o'clock",
	CLUE_SYMBOL.CLOCK_4: "Four o'clock",
	CLUE_SYMBOL.CLOCK_6: "Six o'clock",
	CLUE_SYMBOL.CLOCK_8: "Eight o'clock",
	CLUE_SYMBOL.DRIFTWOOD: "Driftwood",
	CLUE_SYMBOL.FIRE: "Fire",
	CLUE_SYMBOL.FISH: "Fish",
	CLUE_SYMBOL.GOLD: "Gold",
	CLUE_SYMBOL.HEART: "Heart",
	CLUE_SYMBOL.LARGE_BLACK_HORSE: "Large black horse",
	CLUE_SYMBOL.LIGHTNING_BOLT: "Lightning bolt",
	CLUE_SYMBOL.LUTE: "Lute",
	CLUE_SYMBOL.MOON: "Moon",
	CLUE_SYMBOL.RAIN: "Rain",
	CLUE_SYMBOL.RED_HORSE: "Red horse",
	CLUE_SYMBOL.ROSE: "Rose",
	CLUE_SYMBOL.ROSE_SIGIL: "Rose sigil",
	CLUE_SYMBOL.RUBY: "Ruby",
	CLUE_SYMBOL.SMALL_BLACK_HORSE: "Small black horse",
	CLUE_SYMBOL.SMOKE: "Smoke",
	CLUE_SYMBOL.SMOKING_SKULL: "Smoking skull",
	CLUE_SYMBOL.STABLED_WHITE_HORSE: "Stabled white horse",
	CLUE_SYMBOL.SUGAR_CUBE: "Sugar cubes",
	CLUE_SYMBOL.SUNRISE: "Sunrise",
	CLUE_SYMBOL.SUNSET: "Sunset",
	CLUE_SYMBOL.WHITE_HORSE: "White horse",
	CLUE_SYMBOL.RASPBERRY: "Raspberry",
	CLUE_SYMBOL.STRAWBERRY: "Strawberry",
	CLUE_SYMBOL.NONE: "Non symbol type clue",
}

var clue_symbol_alpha_text = {
	CLUE_SYMBOL.APPLE: "Apple",
	CLUE_SYMBOL.BROWN_HORSE: "Horse: Brown",
	CLUE_SYMBOL.CLOCK_0: "Clock 01200midnight",
	CLUE_SYMBOL.CLOCK_10: "Clock 0100",
	CLUE_SYMBOL.CLOCK_12: "Clock 0012noon",
	CLUE_SYMBOL.CLOCK_2: "Clock 0020",
	CLUE_SYMBOL.CLOCK_4: "Clock 0040",
	CLUE_SYMBOL.CLOCK_6: "Clock 0060",
	CLUE_SYMBOL.CLOCK_8: "Clock 0080",
	CLUE_SYMBOL.DRIFTWOOD: "Driftwood",
	CLUE_SYMBOL.FIRE: "Fire",
	CLUE_SYMBOL.FISH: "Fish",
	CLUE_SYMBOL.GOLD: "Gold",
	CLUE_SYMBOL.HEART: "Heart",
	CLUE_SYMBOL.LARGE_BLACK_HORSE: "Horse: Black Large",
	CLUE_SYMBOL.LIGHTNING_BOLT: "Lightning bolt",
	CLUE_SYMBOL.LUTE: "Lute",
	CLUE_SYMBOL.MOON: "Moon",
	CLUE_SYMBOL.RAIN: "Rain",
	CLUE_SYMBOL.RED_HORSE: "Horse: Red",
	CLUE_SYMBOL.ROSE: "Rose DONT USE",
	CLUE_SYMBOL.ROSE_SIGIL: "Rose",
	CLUE_SYMBOL.RUBY: "Ruby",
	CLUE_SYMBOL.SMALL_BLACK_HORSE: "Horse: Black Small",
	CLUE_SYMBOL.SMOKE: "Smoke",
	CLUE_SYMBOL.SMOKING_SKULL: "Smoking skull",
	CLUE_SYMBOL.STABLED_WHITE_HORSE: "Horse: White Stable",
	CLUE_SYMBOL.SUGAR_CUBE: "Sugar cubes",
	CLUE_SYMBOL.SUNRISE: "1 Sunrise",
	CLUE_SYMBOL.SUNSET: "2 Sunset",
	CLUE_SYMBOL.WHITE_HORSE: "Horse: White Outside",
	CLUE_SYMBOL.RASPBERRY: "Raspberry",
	CLUE_SYMBOL.STRAWBERRY: "Strawberry",
	CLUE_SYMBOL.NONE: "Non symbol type clue",
}

var clue_face_display_text = {
	CLUE_FACE.ALBERT: "Albert",
	CLUE_FACE.ALYSSA: "Alyssa",
	CLUE_FACE.FONTAINE: "Fontaine",
	CLUE_FACE.GILDEROY: "Gilderoy",
	CLUE_FACE.LEONA: "Leona",
	CLUE_FACE.PHILIP: "Philip",
	CLUE_FACE.ROBERT: "Robert",
	CLUE_FACE.TOM: "Tom",
}

var clue_symbol_resources = {
	CLUE_SYMBOL.APPLE: preload("res://assets/symbols/symbol.apple.png"),
	CLUE_SYMBOL.BROWN_HORSE: preload("res://assets/symbols/symbol.brown_horse.png"),
	CLUE_SYMBOL.CLOCK_0: preload("res://assets/symbols/symbol.midnight12.30.png"),
	CLUE_SYMBOL.CLOCK_10: preload("res://assets/symbols/symbol.ten12.30.png"),
	CLUE_SYMBOL.CLOCK_12: preload("res://assets/symbols/symbol.clock_12.png"),
	CLUE_SYMBOL.CLOCK_2: preload("res://assets/symbols/symbol.clock_2.png"),
	CLUE_SYMBOL.CLOCK_4: preload("res://assets/symbols/symbol.clock_4.png"),
	CLUE_SYMBOL.CLOCK_6: preload("res://assets/symbols/symbol.clock_6.png"),
	CLUE_SYMBOL.CLOCK_8: preload("res://assets/symbols/symbol.eight12.30.png"),
	CLUE_SYMBOL.DRIFTWOOD: preload("res://assets/symbols/symbol.driftwood.png"),
	CLUE_SYMBOL.FIRE: preload("res://assets/symbols/symbol.fire.png"),
	CLUE_SYMBOL.FISH: preload("res://assets/symbols/symbol.fish.png"),
	CLUE_SYMBOL.GOLD: preload("res://assets/symbols/symbol.gold.png"),
	CLUE_SYMBOL.HEART: preload("res://assets/symbols/symbol.heartcentered.png"),
	CLUE_SYMBOL.LARGE_BLACK_HORSE: preload("res://assets/symbols/symbol.large_black_horse.png"),
	CLUE_SYMBOL.LIGHTNING_BOLT: preload("res://assets/symbols/symbol.lightning12.21.png"),
	CLUE_SYMBOL.LUTE: preload("res://assets/symbols/symbol.lute.png"),
	CLUE_SYMBOL.MOON: preload("res://assets/symbols/symbol.moon12.16.png"),
	CLUE_SYMBOL.RAIN: preload("res://assets/symbols/symbol.raindrop.png"),
	CLUE_SYMBOL.RED_HORSE: preload("res://assets/symbols/symbol.red_horse.png"),
	CLUE_SYMBOL.ROSE: preload("res://assets/symbols/symbol.rose_plant.png"),
	CLUE_SYMBOL.ROSE_SIGIL: preload("res://assets/icons/icon.roseonly500x500.png"),
	CLUE_SYMBOL.RUBY: preload("res://assets/symbols/symbol.ruby.png"),
	CLUE_SYMBOL.SMALL_BLACK_HORSE: preload("res://assets/symbols/symbol.small_black_horse.png"),
	CLUE_SYMBOL.SMOKE: preload("res://assets/symbols/symbol.smoke.png"),
	CLUE_SYMBOL.SMOKING_SKULL: preload("res://assets/symbols/symbol.smoking_skull.png"),
	CLUE_SYMBOL.STABLED_WHITE_HORSE: preload("res://assets/symbols/symbol.stabled_white_horse.png"),
	CLUE_SYMBOL.SUGAR_CUBE: preload("res://assets/symbols/symbol.sugar.png"),
	CLUE_SYMBOL.SUNRISE: preload("res://assets/symbols/symbol.sunrise.png"),
	CLUE_SYMBOL.SUNSET: preload("res://assets/symbols/symbol.sunset.png"),
	CLUE_SYMBOL.WHITE_HORSE: preload("res://assets/symbols/symbol.white_horse.png"),
	CLUE_SYMBOL.RASPBERRY: preload("res://assets/symbols/symbol.raspberry.png"),
	CLUE_SYMBOL.STRAWBERRY: preload("res://assets/symbols/symbol.strawberry.png"),
	CLUE_SYMBOL.NONE: preload("res://assets/close_128.png"),
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

func getClueDisplayText():
	if (type == ClueItem.CLUE_TYPE.NAME):
		return clue_name_display_text.get(name_value)
	elif (type == ClueItem.CLUE_TYPE.SYMBOL):
		return clue_symbol_display_text.get(symbol_value)
	elif (type == ClueItem.CLUE_TYPE.FACE):
		return clue_face_display_text.get(face_value)

func getClueSymbolResource():
	return clue_symbol_resources.get(symbol_value)

func getClueCompatibleDropGroup():
	return clue_type_drop_groups.get(type)

func getClueDebugValue():
	if (type == ClueItem.CLUE_TYPE.NAME):
		return getClueDisplayText()
	elif (type == ClueItem.CLUE_TYPE.SYMBOL):
		return getClueDisplayText()
	elif (type == ClueItem.CLUE_TYPE.FACE):
		return getClueDisplayText

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

