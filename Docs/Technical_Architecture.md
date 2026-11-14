# AFTERFALL — Technical Architecture

## Status
This is an initial architecture proposal for a project in pre-production. It is not a record of existing code.

## Technology constraints
- Unreal Engine 5
- C++ for gameplay implementation
- No Blueprint gameplay logic
- Keep systems modular and testable

## Candidate gameplay systems
- **Player:** character movement, camera, and player state
- **Interaction:** reusable interface and interaction flow
- **Inventory:** item storage, stacking, and equipment
- **Resources:** world resource definitions and gathering
- **Crafting:** recipes, requirements, and item creation
- **Survival:** player needs and environmental effects
- **Building:** placement and base construction
- **AI:** NPC behavior and perception
- **World:** locations, points of interest, and world services
- **Save System:** persistence of player and world state

These are proposed boundaries. They should be split into Unreal modules or classes only when implementation needs justify it.

## Large-world strategy
The intended world scale is a long-term ambition, not a validated requirement. Prototype Unreal Engine 5 World Partition, streaming sources, level-of-detail strategies, and data-driven world content in a small test map before committing to a large-scale layout.

## Engineering principles
- Prefer clear ownership of gameplay state
- Avoid tightly coupling unrelated systems
- Use data assets or other data-driven definitions where appropriate
- Profile early and optimize based on measurements
- Keep generated Unreal files out of source control
- Document major architecture decisions as they are made

## First technical milestone
Create a clean C++ project, compile it, launch a small test map, and verify the source-control workflow. No large-world implementation should be assumed before this milestone is complete.
