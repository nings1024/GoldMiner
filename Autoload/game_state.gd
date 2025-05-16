extends Node

signal gold_changed(value: int)
signal goal_changed(value: int)

var current_gold: int = 0:
	set(value):
		current_gold = value
		emit_signal("gold_changed", value)

var goal_gold: int = 100:
	set(value):
		goal_gold = value
		emit_signal("goal_changed", value)

var time_left: int = 3:
	set(value):
		time_left = value

# 加金币
func add_gold(amount: int):
	current_gold += amount

# 花金币（成功返回 true，失败返回 false）
func spend_gold(amount: int) -> bool:
	if current_gold >= amount:
		current_gold -= amount
		return true
	return false

# 丢失金币（可以负值保护）
func lose_gold(amount: int):
	current_gold = max(0, current_gold - amount)
