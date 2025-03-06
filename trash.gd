class_name trashscreen
extends Node2D

@export var view: myUI.Viewslist

@export var user_interface : myUI
@onready var warrname = get_node('../boss/warr/warrname')
@onready var boss = get_node('../boss/boss')
@onready var lego = get_node('../boss/sham/lego')
@onready var legotext = get_node('../boss/sham/lego/lego')
@onready var legotextwin = get_node('../boss/sham/lego/drop')

func _ready() -> void:
	user_interface.nav_req.connect(_on_nav_req)
	#chose correct trash

func _on_nav_req(requested_view : myUI.Viewslist):
	if requested_view == view:
		visible = true
		return
	visible = false


func _on_killtrash_pressed() -> void:
	$killtrash.visible=0
	Global.currroll = Global.roll()
	print(Global.currroll)
	warrname.text = '%s \n<MULGORE MILKERS>'%Global.playername

	if Global.currroll<=Global.b1chance :
		boss.texture = load('res://assets/graphics/pixelart/models/bossorc.png')
		lego.visible = 1
		legotext.visible = 1
		legotextwin.visible = 0				
		Global.boss = 'orc'
	if Global.b1chance<Global.currroll and Global.currroll<=Global.b2chance :
		boss.texture = load('res://assets/graphics/pixelart/models/boss1.png')
		lego.visible = 0
		Global.boss = 'gri'
	if Global.b2chance<Global.currroll and Global.currroll<=Global.b3chance :
		boss.texture = load('res://assets/graphics/pixelart/models/boss2.png')
		lego.visible = 0
		Global.boss = 'anu'
	if Global.b3chance<Global.currroll and Global.currroll<=Global.b4chance :
		boss.texture = load('res://assets/graphics/pixelart/models/boss3.png')
		lego.visible = 0
		Global.boss = 'spi'
	if Global.b4chance<Global.currroll and Global.currroll<=Global.b5chance :
		boss.texture = load('res://assets/graphics/pixelart/models/boss4.png')
		lego.visible = 0
		Global.boss = 'ogr'
	if Global.b5chance<Global.currroll and Global.currroll<=Global.b6chance :
		boss.texture = load('res://assets/graphics/pixelart/models/boss5.png')
		lego.visible = 0
		Global.boss = 'evi'
			
	$warrww.visible = 1
	await get_tree().create_timer(0.5).timeout
	$warrwweffect.visible = 1
	$wwcast.play()
	await get_tree().create_timer(0.5).timeout
	$warrww.visible = 0
	$warrwweffect.visible = 0
	$enemy1.flip_v=1
	await get_tree().create_timer(0.2).timeout
	$shamhw.visible =1
	$hwcast.play()
	await get_tree().create_timer(1).timeout
	$shamhwefect.visible =1
	await get_tree().create_timer(0.3).timeout
	$warrww.visible = 1
	await get_tree().create_timer(0.2).timeout
	$shamhwefect.visible =0
	$shamhw.visible =0
	$hwland.play()
	await get_tree().create_timer(0.3).timeout
	$warrwweffect.visible = 1
	$wwcast.play()
	await get_tree().create_timer(0.5).timeout
	$warrww.visible = 0
	$warrwweffect.visible = 0
	await get_tree().create_timer(0.3).timeout
	$enemy3.flip_v=1
	$enemy2.flip_v=1
	await get_tree().create_timer(0.5).timeout
	$enemy1.flip_v=0
	$enemy3.flip_v=0
	$enemy2.flip_v=0

	$killtrash.visible=1
	user_interface.nav_req.emit(user_interface.Viewslist.BOSS)
	return
