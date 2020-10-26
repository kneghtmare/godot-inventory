extends ColorRect

var inventory: Inventory = preload("res://Inventory.tres")


func can_drop_data(_position: Vector2, data):
	return data is Dictionary and data.has("item")


func drop_data(_position: Vector2, data):
	inventory.set_item(data.item_index, data.item)
