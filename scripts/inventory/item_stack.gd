extends Resource
class_name ItemStack
## A stack of items stored in the inventory.

@export var item_id: StringName
@export_range(1, 999, 1) var amount: int = 1

func is_empty() -> bool:
	return String(item_id).is_empty() or amount <= 0

func copy_stack() -> ItemStack:
	var result := ItemStack.new()
	result.item_id = item_id
	result.amount = amount
	return result
