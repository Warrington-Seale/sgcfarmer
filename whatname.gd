class_name whatnamescreen
extends Node2D

@export var view: myUI.Viewslist

@export var user_interface : myUI

@onready var namefield = get_node("namebox")

func _ready() -> void:
	user_interface.nav_req.connect(_on_nav_req)

func _on_nav_req(requested_view : myUI.Viewslist):
	if requested_view == view:
		visible = true
		return
	visible = false


func _on_startgrind_pressed() -> void:
	Global.playername = namefield.get_text()
	#print(Global.playername)
	user_interface.nav_req.emit(user_interface.Viewslist.ENTERANCE)
	return
