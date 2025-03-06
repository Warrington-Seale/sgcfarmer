class_name myUI
extends Control

enum Viewslist {
	WELCOME,
	WHATNAME,
	ENTERANCE,
	ARENADWARF,
	TRASH,
	BOSS,
}

func _ready() -> void:
	nav_req.emit(Viewslist.WELCOME)



signal nav_req(view: Viewslist)

func _on_letsgoo_pressed() -> void:
	#when letsgo button pressed, display whatname screen 
	nav_req.emit(Viewslist.WHATNAME)
