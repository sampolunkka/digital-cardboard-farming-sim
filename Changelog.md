# Digital cardboard farming sim

## 4.8.2023
### Card
- Change card movement to use real x & y instead of rounded value
	- Prevents card prematurely reaching 0 movement speed
	- Actual drawn x & y coordinates are still rounded to whole numbers

### TurnController
- Add turn controller
- Add interface to start turn, end turn, start next phase

### Phase
- Add phase
	- Phase is used to execute actions related to phase 
	- eg. hypothetical start phase would trigger drawing a card and other start of the turn actions

### Action
- Add action
	- Action is an effect that can be triggered by other objects
	- Cards, phases and other game events could have actions

## 30.7.2023
### Placeholder
- Add placeholder controller
	- Draggin a card to an eligible zone creates a temporary placeholder
	- Placeholder creates (visual) space in the position where card would be placed
	
### Housekeeping
- Remove unused functions

## 29.7.2023
### Hand
- Add function to place card in hand to player determined position

### Zone
- Add function to swap two cards betwen zones

## 28.7.2023
### Housekeeping
- Move old to be removed objects under x_toberemoved

### Cards
- Recreate card object
- Cards no longer keep track of their zone, index, etc.
- Cards track their internal state and provide an interface to manipulate it

### Zones
- Replace board objects with zone system
- Zones keep track of their internal state and cards inside their specific zone
- Zones provide an interface to move cards between zones and to manipulate their internal state

### Player card controller
- Create player card controller for manipulating cards
- Controller is stateless and relies on zones and cards to track their internal state