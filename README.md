# MTG Companion

Companion app for Magic The Gathering.
It collects card information using https://api.magicthegathering.io/ REST API
and stores it in a local Hive database, for offline preview. It also allows sorting
by name, type, rarity and set.



## Project Overview
Managed project files are contained in the lib folder.
```
lib/
├── models/
├── services/
├── themes/
├── widgets/
└── main.dart
```

### Models
There are 3 data models in this project.  
**MtgCard** - Represents singular card with all relevant data.  
**MtgCardFilter** - Represents a set of filters when searching through data.  
**MtgCardSet** - Represents a singular set of cards.  
### Services
There are 3 services in this project. Every one is a singleton, however
only CardFetchingService should be used, as the other two are being orchestrated
by it.  
**CardFetchingService** - Uses CardApiService and CardDatabaseService to fetch and store data.  
**CardApiService** - Fetches data from MTG REST API.  
**CardDatabaseService** - Stores and fetched data from local Hive database.  
### Themes
There is currently only a single theme file, MainTheme.dart. It tries it's best to 
assign appropriate theme to every widget used in the project. It also provides constant colors for 
every widget that didn't get a proper theme.  
### Widgets
There are 2 subfolders, components and screens. Screens are composed
of components and orchestrate the flow of the app.  
#### Components
**Error popup** - Widget with a button, that displays a
given message along with a callback button.  
**Select menu** - A popup menu, that given a list of strings, returns a value selected
by the user with a Navigator.pop function.  
**TextBoxed** - A decorated container with text inside.  
**Throbber** - Spinning circle indicating progress.  
Next, there are components in home_screen folder, they are only used
by the home screen.  
**HomeScreenFilterBar** - Widget responsible for getting filters when searching for cards.
It contains SearchBar, 3 buttons responsible for getting type, rarity and set filters and clear button,
that clears the filters.  
**HomeScreenCardPreview** - A preview of a single card, displays either text with the name
of the card, or the card image once it's loaded. It also contains a gesture detector, that when
tapped, moves to details screen with associated card.  
**HomeScreenCardScroll** - Main scrollable widget of the home screen, it's contains card previews.  
**HomeScreenPageControl** - Widget responsible for displaying the current page number and changing it with back 
and forward buttons.  
#### Screens
**HomeScreen** - Main screen of the app, displays 100 cards, allows for filtering them
and pagination.  
**DetailsScreen** - Secondary screen of the app, displays more details for the given card.