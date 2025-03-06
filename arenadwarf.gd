class_name arenadwarfscreen
extends Node2D

@export var view: myUI.Viewslist

@export var user_interface : myUI

func _ready() -> void:
	user_interface.nav_req.connect(_on_nav_req)

func _on_nav_req(requested_view : myUI.Viewslist):
	if requested_view == view:
		visible = true
		return
	visible = false


func _on_startencounter_pressed() -> void:
	#playadnimation
	Global.currroll = Global.roll()
	user_interface.nav_req.emit(user_interface.Viewslist.TRASH)
	return
