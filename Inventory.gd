extends Resource
class_name Inventory

signal items_changed(indexes)

export (Array, Resource) var items: Array = [
	null, null, null,
	null, null, null,
	null, null, null
]


func set_item(item_index: int, item: Item) -> Item:
	var previous_item = items[item_index] #stores the previous_item
	items[item_index] = item #sets the item_index index in items to the passed in tem
	emit_signal("items_changed",[item_index]) 
	return previous_item


func swap_items(item_index: int, target_item_index: int) -> void:
	#stores both the target item and the item to be swapped
	var target_item = items[target_item_index] 
	var item = items[item_index]
	#swaps them
	items[item_index] = target_item
	items[target_item_index] = item
	emit_signal("item_changed",[item_index, target_item_index])


func remove_item(item_index: int) -> Item:
	var previous_item = items[item_index]
	items[item_index] = null #sets the item_index index in items to null
	emit_signal("items_changed",[item_index])
	return previous_item
