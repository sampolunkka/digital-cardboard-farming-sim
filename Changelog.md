### Digital cardboard farming sim

## 29.7.2023
# Housekeeping
- Move old to be removed objects under x_toberemoved

# Cards
- Recreate card object
- Cards no longer keep track of their zone, index, etc.
- Cards track their internal state and provide an interface to manipulate it

# Zones
- Replace board objects with zone system
- Zones keep track of their internal state and cards inside their specific zone
- Zones provide an interface to move cards between zones and to manipulate their internal state

# Player card controller
- Create player card controller for manipulating cards
- Controller is stateless and relies on zones and cards to track their internal state