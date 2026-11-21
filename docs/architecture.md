# Technical Architecture

## Engine

Godot 4.x, GDScript. Проект не требует Unreal Engine 5.

## Layers

- **Scenes:** визуальные сцены и игровые объекты.
- **Scripts:** игровые контроллеры и правила.
- **Data:** JSON-описания предметов, регионов и параметров.
- **Systems:** независимые сервисы сохранения и настроек.
- **Docs:** дизайн-документы и технические решения.

## Current foundation

- Runtime greybox test scene.
- Basic CharacterBody3D player.
- Third-person camera with first-person toggle.
- Keyboard movement, jump and sprint.
- PlayerStats resource for health and stamina.
- PlayerInventory and ItemStack resources.
- WorldInteractable base class and ray-based PlayerInteraction helper.
- JSON save service and ConfigFile settings service.
- Starter JSON data for items, regions and player defaults.

## Integration status

The systems above are initial modules and are **not all connected to the active gameplay scene yet**. The next milestone is to wire them into the player and a small playable location, then verify the complete loop inside Godot.

## Architecture rules

1. Не смешивать игровые правила с UI.
2. Конфигурации и контент хранить отдельно от кода, где это разумно.
3. Системы делать небольшими и тестируемыми.
4. Не создавать огромные системы до появления работающего вертикального среза.
5. Сохранять совместимость данных и документировать изменения форматов.
6. Не считать систему завершённой до проверки в редакторе и во время запуска игры.
