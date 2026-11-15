# AFTERFALL — Game Design Document

## Document status

This is a working design document for the concept and pre-production stage. It records confirmed direction separately from proposals and unanswered questions. Nothing in this document should be treated as implemented gameplay.

## 1. Game identity

- **Working title:** AFTERFALL
- **Genre direction:** 3D open-world survival
- **Setting:** Earth, one year after a global nuclear catastrophe
- **Engine:** Unreal Engine 5
- **Gameplay implementation:** C++
- **Blueprint gameplay:** Not planned

## 2. Confirmed creative direction

The game is intended to focus on:
- Exploring abandoned places and wilderness
- Surviving in a dangerous post-catastrophe environment
- Searching for useful resources
- Crafting equipment
- Building or improving shelters
- Encountering NPCs and settlements
- Eventually travelling using suitable transport

The long-term world-size idea of approximately 200 × 200 km is an ambition only. It is not a production commitment and must be evaluated through technical prototypes.

## 3. Player experience goals

These are design goals to validate, not implemented features:

- **Discovery:** locations should reward careful exploration.
- **Preparation:** choosing what to carry and when to travel should matter.
- **Scarcity:** resources should encourage meaningful decisions without making progress feel arbitrary.
- **Consequences:** the environment and player choices should influence the difficulty of an expedition.
- **Believable world:** abandoned places and settlements should communicate that people lived and adapted there.

## 4. Core gameplay pillars

### Explore
Discover settlements, cities, wilderness, bunkers, and other locations.

### Survive
Respond to essential needs and environmental hazards. The exact needs, rules, and severity remain undecided.

### Scavenge
Search locations for materials, tools, and supplies. Loot distribution and respawn rules remain undecided.

### Craft
Use collected resources to create or maintain useful equipment. Recipe complexity and progression remain undecided.

### Build
Create or improve shelters and bases. Building rules, placement limits, and persistence remain undecided.

### Interact
Meet NPCs, groups, and settlements. Dialogue, reputation, trading, and faction systems are not yet defined.

### Travel
Explore larger distances over time. Vehicles and transport systems are future concepts, not confirmed first-prototype features.

## 5. Prototype-first gameplay hypothesis

A small first prototype could test this loop:

1. Start in a small test area.
2. Explore a nearby location.
3. Find and collect a limited set of resources.
4. Return to a safe point.
5. Use collected resources for one simple crafting or preparation action.
6. Save the game and verify that the relevant state is restored.

This is a suggested test loop, not a final design. It should be reduced further if needed to keep the first playable build achievable.

## 6. Scope boundaries

For the first playable prototype:
- Use one small test environment, not the full open world.
- Implement only the minimum systems needed to test the core loop.
- Use placeholder assets where practical.
- Avoid committing to multiplayer, complex factions, large vehicle systems, or a huge world before the basics are validated.

## 7. Open design decisions

The following questions need the project owner's decisions:

- Single-player, multiplayer, or a staged approach?
- Which platforms are target platforms?
- What is the intended camera perspective?
- Which survival needs are essential to the experience?
- How punishing should failure and resource scarcity be?
- What is the initial playable location?
- What should the player do in the first 10–15 minutes?
- How should NPC groups and settlements work?
- What role should crafting and base building play in progression?
- Which transport types, if any, belong in the first major release?
- What visual direction should guide environments and user interface?

## 8. Design decision log

Record important decisions here when they are made. Include the date, decision, reason, and any consequences for scope or technology.

| Date | Decision | Reason / consequences |
|---|---|---|
| TBD | No final design decisions recorded yet | This section will be updated as decisions are confirmed |

## 9. Related documents

- [Game Overview](Game_Overview.md)
- [Development Roadmap](Roadmap.md)
- [Technical Architecture](Technical_Architecture.md)
