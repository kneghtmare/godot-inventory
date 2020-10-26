extends CenterContainer
class_name InventorySlotDisplay

var emptyInventorySlotTexture = preload("res://Items/EmptyInventorySlot.png")
var inventory: Inventory = preload("res://Inventory.tres")

onready var itemTextureRect = $ItemTextureRect


func display_item(item: Item) -> void:
	if item is Item: #if item is not null
		#sets the texture of the texture rect to the passed in item's texture
		itemTextureRect.texture = item.texture
	else:
		itemTextureRect.texture = emptyInventorySlotTexture


func get_drag_data(_position: Vector2) -> Dictionary:
	var item_index: int = get_index()
	var item: Item = get_item()
	display_item(null)
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
	display_item(get_item())
	#gets our item
	var my_item_index: int = get_index()
	var my_item = inventory.items[my_item_index]
	inventory.swap_items(my_item_index, data.item_index)
	inventory.set_item(my_item_index, data.item)
	
	
