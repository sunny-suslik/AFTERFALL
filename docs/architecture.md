# Technical Architecture

## Engine

Godot 4.x, GDScript. Проект не требует Unreal Engine 5.

## Layers

- **Scenes:** визуальные сцены и игровые объекты.
- **Scripts:** игровая логика и контроллеры.
- **Data:** JSON-описания предметов, регионов и контента.
- **Systems:** независимые сервисы и правила игры.
- **Docs:** дизайн-документы и технические решения.

## Rules

1. Не смешивать игровые правила с UI.
2. Конфигурации и контент хранить отдельно от кода, где это разумно.
3. Системы делать небольшими и тестируемыми.
4. Не создавать огромные системы до появления работающего вертикального среза.
5. Сохранять совместимость данных и документировать изменения форматов.

## Current prototype

- Runtime greybox test scene.
- Basic CharacterBody3D player.
- Third-person camera with first-person toggle.
- Keyboard movement, jump and sprint.
- Starter JSON data and lore documentation.
