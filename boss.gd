class_name bossscreen
extends Node2D

@export var view: myUI.Viewslist

@export var user_interface : myUI

@onready var killbossbutton = get_node("killboss")
@onready var lootbossbutton = get_node("lootbnoss")
@onready var resetbutton = get_node("reset")
@onready var trieslabel = get_node("../HUD/triesLabel")
@onready var mainscene = get_node("../..")
func _ready() -> void:
	user_interface.nav_req.connect(_on_nav_req)

func _on_nav_req(requested_view : myUI.Viewslist):
	if requested_view == view:
		visible = true
		resetscreen()
		return
	visible = false

func resetscreen() -> void:
	killbossbutton.visible = 1
	lootbossbutton.visible = 0
	resetbutton.visible = 0

func _on_killboss_pressed() -> void:
		## when killboss button pressed, start animation, hide killboss button, wait for 3s and display lootboss button and increase tries by 1
	#start animation
	killbossbutton.visible = 0
	#wait for animation
	lootbossbutton.visible = 1
	Global.tries +=1
	pass # Replace with function body.


func _on_lootbnoss_pressed() -> void:
	##when lootboss button pressed, show tries label, roll for loot, display loot, and: if loot = sgc, fin, if not display reset button
	mainscene.updateTriesLabel()
	trieslabel.visible = 1
	Global.currroll = Global.roll()
	#displaylooot - dev - not sgc
	lootbossbutton.visible =0
	if true:
		resetbutton.visible = 1


func _on_reset_pressed() -> void:
	##when reset button pressed, hide loot, show animation and  display to fresh enterance screen
	#hide loot
	#show runout animation
	user_interface.nav_req.emit(user_interface.Viewslist.ENTERANCE)
	pass # Replace with function body.
