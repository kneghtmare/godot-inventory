extends GridContainer

var inventory: Inventory = preload("res://Inventory.tres")

func _ready() -> void:
	inventory.connect("items_changed",self,"_on_items_changed")
	inventory.make_items_unique()
	update_slot_displays()


func update_slot_displays() -> void:
	for child in get_children():
		child.update_display()


func _on_items_changed(indexes: Array) -> void:
	update_slot_displays()
