extends Node

var playername:String
var tries:int = 0
var currroll:int =0
var lootroll:int =0
var rng=RandomNumberGenerator.new()
var boss:String=''

#out of 1k
var t1chance = 200
var t2chance = 400
var t3chance = 600
var t4chance = 800
var t5chance = 1000

#out of 1k
var b1chance = 166
var b2chance = 332
var b3chance = 499
var b4chance = 666
var b5chance = 833
var b6chance = 1000

func roll() ->int:
	return rng.randi_range(0,1000)
	
func roll3() ->int:
	return rng.randi_range(0,2)
func roll4() ->int:
	return rng.randi_range(0,3)
