extends CenterContainer
class_name InventorySlotDisplay

var emptyInventorySlotTexture = preload("res://Items/EmptyInventorySlot.png")
var inventory: Inventory = preload("res://Inventory.tres")

onready var itemTextureRect = $ItemTextureRect
onready var itemAmountLabel = $ItemTextureRect/ItemAmountLabel


func display_item(item: Item) -> void:
	if item is Item: #if item is not null
		#sets the texture of the texture rect to the passed in item's texture
		itemTextureRect.texture = item.texture
		itemAmountLabel.text = str(item.amount)
	else:
		itemTextureRect.texture = emptyInventorySlotTexture
		itemAmountLabel.text = ""


func update_display() -> void:
	display_item(get_item())
			

func get_drag_data(_position: Vector2) -> Dictionary:
	var item_index: int = get_index()
	var item: Item = inventory.remove_item(item_index)
	if item is Item:
		var data: Dictionary = {}
		data.item = item
		data.item_index = item_index
		var dragPreview: TextureRect = TextureRect.new()
		dragPreview.texture = item.texture
		set_drag_preview(dragPreview)
		return data
	
	return {}	


func get_item() -> Item:
	var my_index: int = get_index()
	return inventory.items[my_index]
		

func can_drop_data(_position: Vector2, data) -> bool:
	return data is Dictionary and data.has("item")

	
func drop_data(_position, data):
	#gets the item that was previously there and stores it inside my_item
	var my_item_index: int = get_index()
	var my_item: Item = inventory.items[my_item_index]
	
	if my_item is Item and my_item.name == data.item.name:
		my_item.amount += data.item.amount
		inventory.emit_signal("items_changed", [my_item_index])
	else:
		inventory.swap_items(my_item_index, data.item_index)
		inventory.set_item(my_item_index, data.item)
		display_item(get_item())
				
