class_name sgcfarmergame
extends Node

@export var trieslabel: Label

var triescounter : int = 0
var playername :String = ''

#out of 1k
var t1chance = 200
var t2chance = 200
var t3chance = 200
var t4chance = 200
var t5chance = 200

#out of 1k
var b1chance = 166
var b2chance = 166
var b3chance = 167
var b4chance = 167
var b5chance = 167
var b6chance = 167


func updateTriesLabel() -> void:
	trieslabel.text = "Tries: %s" %triescounter


func _on_letsgoo_pressed() -> void:
	#when letsgo button pressed, display whatname screen 
	pass


func _on_startgrind_pressed() -> void:
	#when startgrind button pressed, save name from namebox to var, and display enterance screen
	pass


func _on_headarena_pressed() -> void:
	# when headarena button pressed, start animation and after 3s display arenadwarf screen
	pass # Replace with function body.


func _on_startencounter_pressed() -> void:
	# when startencounter button pressed, start animation, roll for type of trash and after 2s display trash screen
	pass # Replace with function body.


func _on_killtrash_pressed() -> void:
	#when killtrash button pressed, start animation, roll for boss type, and after 3s display boss screen
	pass # Replace with function body.


func _on_killboss_pressed() -> void:
	# when killboss button pressed, start animation, hide killboss button, wait for 3s and display lootboss button and increase tries by 1
	pass # Replace with function body.
	
	
func _on_lootbnoss_pressed() -> void:
	#when lootboss button pressed, roll for loot, display loot, and: if loot = sgc, fin, if not display reset button
	pass # Replace with function body.


func _on_reset_pressed() -> void:
	#when reset button pressed, hide loot, show animation and  display to fresh enterance screen
	pass # Replace with function body.
