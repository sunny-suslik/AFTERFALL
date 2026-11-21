extends Resource
class_name PlayerInventory
## Lightweight inventory model. Item definitions are loaded from data/items.json.

signal changed

@export_range(1, 200, 1) var capacity: int = 24
var slots: Array[ItemStack] = []

func add_item(item_id: StringName, amount: int, stack_limit: int = 50) -> int:
	if String(item_id).is_empty() or amount <= 0 or stack_limit <= 0:
		return amount

	var remaining := amount
	for stack in slots:
		if stack.item_id == item_id and stack.amount < stack_limit:
			var moved := mini(remaining, stack_limit - stack.amount)
			stack.amount += moved
			remaining -= moved
			if remaining == 0:
				changed.emit()
				return 0

	while remaining > 0 and slots.size() < capacity:
		var moved := mini(remaining, stack_limit)
		var stack := ItemStack.new()
		stack.item_id = item_id
		stack.amount = moved
		slots.append(stack)
		remaining -= moved

	changed.emit()
	return remaining

func remove_item(item_id: StringName, amount: int) -> bool:
	if amount <= 0 or count_item(item_id) < amount:
		return false

	var remaining := amount
	for index in range(slots.size() - 1, -1, -1):
		var stack := slots[index]
		if stack.item_id != item_id:
			continue
		var removed := mini(remaining, stack.amount)
		stack.amount -= removed
		remaining -= removed
		if stack.amount <= 0:
			slots.remove_at(index)
		if remaining == 0:
			break

	changed.emit()
	return true

func count_item(item_id: StringName) -> int:
	var total := 0
	for stack in slots:
		if stack.item_id == item_id:
			total += stack.amount
	return total

func has_space() -> bool:
	return slots.size() < capacity

func clear() -> void:
	slots.clear()
	changed.emit()
