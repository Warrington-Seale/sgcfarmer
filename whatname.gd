class_name whatnamescreen
extends Node2D

@export var view: myUI.Viewslist

@export var user_interface : myUI

@onready var namefield = get_node("namebox")
@onready var warrname = get_node("UI/enterance/warrpath/warrmover/warr/warrname")

func _ready() -> void:
	user_interface.nav_req.connect(_on_nav_req)

func _on_nav_req(requested_view : myUI.Viewslist):
	if requested_view == view:
		visible = true
		return
	visible = false

func updateWarrname() ->void:
	pass

func _on_startgrind_pressed() -> void:
	Global.playername = namefield.get_text()
	#?!?!?!?!?!?!?$UI/enterance/warrpath/warrmover/warr/warrname.modulate('%s \n<MULGORE MILKERS>'%Global.playername)
	#print(Global.playername)
#	$UI/enterance/warrpath/warrmover/warr/Label2.text = '%s \n<MULGORE MILKERS>'%Global.playername
	user_interface.nav_req.emit(user_interface.Viewslist.ENTERANCE)
	return
