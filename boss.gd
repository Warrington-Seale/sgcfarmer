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
	$warrms.visible = 1
	await get_tree().create_timer(0.5).timeout
	$warrmsefect.visible=1
	$ms.play()
	await get_tree().create_timer(0.5).timeout
	$warrms.visible = 0
	$warrmsefect.visible = 0
	await get_tree().create_timer(0.2).timeout
	$shamhw.visible =1
	$hwcast.play()
	await get_tree().create_timer(1).timeout
	$shamhwefect.visible =1
	$hwland.play()
	await get_tree().create_timer(0.3).timeout
	$warrexe.visible = 1
	await get_tree().create_timer(0.2).timeout
	$shamhwefect.visible =0
	$shamhw.visible =0
	await get_tree().create_timer(0.3).timeout
	$warrmsefect.visible = 1
	$exe.play()
	await get_tree().create_timer(0.5).timeout
	$warrexe.visible = 0
	$warrmsefect.visible = 0
	await get_tree().create_timer(0.5).timeout
	$boss.flip_v=1
	
	lootbossbutton.visible = 1
	Global.tries +=1
	pass # Replace with function body.


func _on_lootbnoss_pressed() -> void:
	##when lootboss button pressed, show tries label, roll for loot, display loot, and: if loot = sgc, fin, if not display reset button
	mainscene.updateTriesLabel()
	trieslabel.visible = 1
	Global.lootroll = Global.roll()

	#displaylooot - dev - not sgc
	lootbossbutton.visible =0
	
	if Global.boss == 'orc':
		Global.lootroll = Global.roll()
		#Global.lootroll =1
		if Global.lootroll <= 136:
			$lootframe/looticon.texture = load('res://assets/graphics/pixelart/loot/orcsgc.png')
			$lootframe/lootname.text = 'fucking SGC'
			$lootframe/lootname.set("theme_override_colors/font_color",Color('#682f96'))
			$lootframe.visible = 1
		if 136 < Global.lootroll and Global.lootroll< 424:
			$lootframe/looticon.texture = load('res://assets/graphics/pixelart/loot/orc1.png')
			$lootframe/lootname.text = 'useless dagger'
			$lootframe.visible = 1
		if 424 < Global.lootroll and Global.lootroll< 712:
			$lootframe/looticon.texture = load('res://assets/graphics/pixelart/loot/orc2.png')
			$lootframe/lootname.text = 'useless pants'
			$lootframe.visible = 1
		if 712 < Global.lootroll and Global.lootroll< 1000:
			$lootframe/looticon.texture = load('res://assets/graphics/pixelart/loot/orc3.png')
			$lootframe/lootname.text = 'useless ring'
			$lootframe.visible = 1
	if Global.boss == 'gri':
		Global.lootroll = Global.roll3()
		if Global.lootroll == 0:
			$lootframe/looticon.texture = load('res://assets/graphics/pixelart/loot/gri1.png')
			$lootframe/lootname.text = 'Fucking axe'
			$lootframe.visible = 1
		if Global.lootroll == 1:
			$lootframe/looticon.texture = load('res://assets/graphics/pixelart/loot/gri2.png')
			$lootframe/lootname.text = 'PALA LOOT'
			$lootframe.visible = 1
		if Global.lootroll == 2:
			$lootframe/looticon.texture = load('res://assets/graphics/pixelart/loot/gri3.png')
			$lootframe/lootname.text = 'Enh pauldrons'
			$lootframe.visible = 1			
	if Global.boss == 'anu':
		Global.lootroll = Global.roll3()
		if Global.lootroll == 0:
			$lootframe/looticon.texture = load('res://assets/graphics/pixelart/loot/anu1.png')
			$lootframe/lootname.text = 'Rogue boots?!?'
			$lootframe.visible = 1
		if Global.lootroll == 1:
			$lootframe/looticon.texture = load('res://assets/graphics/pixelart/loot/anu2.png')
			$lootframe/lootname.text = 'WARRIOR CHEST'
			$lootframe.visible = 1
		if Global.lootroll == 2:
			$lootframe/looticon.texture = load('res://assets/graphics/pixelart/loot/anu3.png')
			$lootframe/lootname.text = 'Healz cloak'
			$lootframe.visible = 1			
	if Global.boss == 'evi':
		Global.lootroll = Global.roll3()
		if Global.lootroll == 0:
			$lootframe/looticon.texture = load('res://assets/graphics/pixelart/loot/evi1.png')
			$lootframe/lootname.text = 'Rogue belt'
			$lootframe.visible = 1
		if Global.lootroll == 1:
			$lootframe/looticon.texture = load('res://assets/graphics/pixelart/loot/evi2.png')
			$lootframe/lootname.text = 'SAVAGE GLADIATOR...\ngrips....'
			$lootframe.visible = 1
		if Global.lootroll == 2:
			$lootframe/looticon.texture = load('res://assets/graphics/pixelart/loot/evi3.png')
			$lootframe/lootname.text = 'Enh pauldrons'
			$lootframe.visible = 1	
	if Global.boss == 'spi':
		Global.lootroll = Global.roll3()
		if Global.lootroll == 0:
			$lootframe/looticon.texture = load('res://assets/graphics/pixelart/loot/spi1.png')
			$lootframe/lootname.text = 'Pala gear,\nDiv need!'
			$lootframe.visible = 1
		if Global.lootroll == 1:
			$lootframe/looticon.texture = load('res://assets/graphics/pixelart/loot/spi2.png')
			$lootframe/lootname.text = 'Healer prebis'
			$lootframe.visible = 1
		if Global.lootroll == 2:
			$lootframe/looticon.texture = load('res://assets/graphics/pixelart/loot/spi3.png')
			$lootframe/lootname.text = 'SAVAGE GLADIATOR...\nhelm...'
			$lootframe.visible = 1	
	if Global.boss == 'ogr':
		Global.lootroll = Global.roll4()
		if Global.lootroll == 0:
			$lootframe/looticon.texture = load('res://assets/graphics/pixelart/loot/ok1.png')
			$lootframe/lootname.text = 'caster prebis belt!'
			$lootframe.visible = 1
		if Global.lootroll == 1:
			$lootframe/looticon.texture = load('res://assets/graphics/pixelart/loot/ok2.png')
			$lootframe/lootname.text = 'Nice ring!...\n for healers...'
			$lootframe.visible = 1
		if Global.lootroll == 2:
			$lootframe/looticon.texture = load('res://assets/graphics/pixelart/loot/ok3.png')
			$lootframe/lootname.text = 'SAVAGE GLADIATOR...\npants...'
			$lootframe.visible = 1			
		if Global.lootroll == 3:
			$lootframe/looticon.texture = load('res://assets/graphics/pixelart/loot/ok4.png')
			$lootframe/lootname.text = 'Another heal prebis'
			$lootframe.visible = 1		
	
	if $lootframe/lootname.text == 'fucking SGC':#if sgc dropped
		$sham/lego.visible=1
		$sham/lego/drop.visible=1
		$sham/lego/lego.visible=0
		$yay.visible=1
		pass#win
	else:
		resetbutton.visible = 1
   

func _on_reset_pressed() -> void:
	##when reset button pressed, hide loot, show animation and  display to fresh enterance screen
	#hide loot
	#show runout animation
	$boss.flip_v=0 
	$lootframe.visible = 0
	user_interface.nav_req.emit(user_interface.Viewslist.ENTERANCE)
	pass # Replace with function body.
