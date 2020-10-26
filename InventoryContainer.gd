extends ColorRect

var inventory: Inventory = preload("res://Inventory.tres")
onready var inventoryDisplay = $CenterContainer/InventoryDisplay


func can_drop_data(_position: Vector2, data) -> bool:
	return data is Dictionary and data.has("item")


func drop_data(_position: Vector2, data) -> void:
	var correct_item_amount = data.item.amount
	inventory.set_item(data.item_index, data.item)
	inventory.items[data.item_index].amount = correct_item_amount
