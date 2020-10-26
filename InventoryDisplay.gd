extends GridContainer

var inventory = preload("res://Inventory.tres")

func _ready() -> void:
	inventory.connect("items_changed",self,"_on_items_changed")


func update_inventory_slot_display(item_index):
	var inventorySlotDisplay: InventorySlotDisplay = get_child(item_index)
	var item = inventory.items[item_index]
	inventorySlotDisplay.display_item(item)
	

func _on_items_changed(indexes: Array) -> void:
	for item_index in indexes:
		update_inventory_slot_display(item_index)
