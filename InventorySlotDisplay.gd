extends CenterContainer
class_name InventorySlotDisplay

onready var itemTextureRect = $ItemTextureRect
var emptyInventorySlotTexture = preload("res://Items/EmptyInventorySlot.png")


func display_item(item: Item) -> void:
	if item: #if item is not null
		#sets the texture of the texture rect to the passed in item's texture
		itemTextureRect.texture = item.texture
	else:
		itemTextureRect.texture = emptyInventorySlotTexture

