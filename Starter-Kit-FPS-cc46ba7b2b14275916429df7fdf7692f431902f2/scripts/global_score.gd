# Global.gd
extends Node

var score := 0

func add_score(amount: int):
	score += amount

func reset_score():
	score = 0
