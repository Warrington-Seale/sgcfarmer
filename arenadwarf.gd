class_name arenadwarfscreen
extends Node2D

@export var view: myUI.Viewslist

@export var user_interface : myUI
@onready var warrname=get_node("../trash/warr/warrname")
@onready var t1 = get_node('../trash/enemy1')
@onready var t2 = get_node('../trash/enemy2')
@onready var t3 = get_node('../trash/enemy3')

func _ready() -> void:
	user_interface.nav_req.connect(_on_nav_req)

func _on_nav_req(requested_view : myUI.Viewslist):
	if requested_view == view:
		visible = true
		return 
	visible = false


func _on_startencounter_pressed() -> void:
	
	$startencounter.visible=0
	$offwith.play()
	Global.currroll = Global.roll()
	print(Global.currroll)
	warrname.text = '%s \n<MULGORE MILKERS>'%Global.playername
	if Global.currroll<=Global.t1chance :
		t1.texture = load('res://assets/graphics/pixelart/models/trash1.png')
		t2.texture = load('res://assets/graphics/pixelart/models/trash1.png')
		t3.texture = load('res://assets/graphics/pixelart/models/trash1.png')
	if Global.t1chance<Global.currroll and Global.currroll<=Global.t2chance :
		t1.texture = load('res://assets/graphics/pixelart/models/trash2.png')
		t2.texture = load('res://assets/graphics/pixelart/models/trash2.png')
		t3.texture = load('res://assets/graphics/pixelart/models/trash2.png')
	if Global.t2chance<Global.currroll and Global.currroll<=Global.t3chance :
		t1.texture = load('res://assets/graphics/pixelart/models/trash3.png')
		t2.texture = load('res://assets/graphics/pixelart/models/trash3.png')
		t3.texture = load('res://assets/graphics/pixelart/models/trash3.png')	
	if Global.t3chance<Global.currroll and Global.currroll<=Global.t4chance :
		t1.texture = load('res://assets/graphics/pixelart/models/trash4.png')
		t2.texture = load('res://assets/graphics/pixelart/models/trash4.png')
		t3.texture = load('res://assets/graphics/pixelart/models/trash4.png')	
	if Global.t4chance<Global.currroll and Global.currroll<=Global.t5chance :
		t1.texture = load('res://assets/graphics/pixelart/models/trash5.png')
		t2.texture = load('res://assets/graphics/pixelart/models/trash5.png')
		t3.texture = load('res://assets/graphics/pixelart/models/trash5.png')	
	$portal2/Sprite2D.visible=1
	await get_tree().create_timer(1.0).timeout	
	$portal2/Sprite2D.visible = 0	
	$startencounter.visible=1
	user_interface.nav_req.emit(user_interface.Viewslist.TRASH)
	return
