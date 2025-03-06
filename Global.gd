extends Node

var playername:String
var tries:int = 0
var currroll:int =0
var rng=RandomNumberGenerator.new()

#out of 1k
var t1chance = 200
var t2chance = 200
var t3chance = 200
var t4chance = 200
var t5chance = 200

#out of 1k
var b1chance = 166
var b2chance = 166
var b3chance = 167
var b4chance = 167
var b5chance = 167
var b6chance = 167

func roll() ->int:
	return rng.randi_range(0,1000)
