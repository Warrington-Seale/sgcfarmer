class_name enterancescreen
extends Node2D

var t :=0.0
var Switch=0
@export var view: myUI.Viewslist
#@export Label
@export var user_interface : myUI
@onready var warrname = get_node("../arenadwarf/warr2/warrname")
 

func _ready() -> void:
	user_interface.nav_req.connect(_on_nav_req)
#	$warrpath/warrmover/warrname.text='%s\n<MULGORE MILKERS>'%Global.playername

func _on_nav_req(requested_view : myUI.Viewslist):
	if requested_view == view:
		visible = true
		return
	visible = false

func _process(delta: float) -> void:
	$warrpath/warrmover/warr/Label2.text = '%s\n<MULGORE MILKERS>'%Global.playername

func _physics_process(delta: float) -> void:
	const movespeed = 200
	$warrpath/warrmover.progress += delta*movespeed*Switch
	$shampath/shammover.progress += delta*movespeed*Switch

func _on_headarena_pressed() -> void:
	#animation
	$Headarena.visible=0
	$run.play()
	Switch=1
	warrname.text = '%s \n<MULGORE MILKERS>'%Global.playername
	await get_tree().create_timer(2.0).timeout	
	$warrpath/warrmover.progress = 0
	$shampath/shammover.progress = 0
	Switch=0
	$Headarena.visible=1
	user_interface.nav_req.emit(user_interface.Viewslist.ARENADWARF)
	return
