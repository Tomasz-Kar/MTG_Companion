import 'package:flutter/material.dart';
import 'package:mtg_companion/models/mtg_card.dart';
import 'package:mtg_companion/models/mtg_card_filters.dart';
import 'package:mtg_companion/models/mtg_set.dart';
import 'package:mtg_companion/services/card_fetching_service.dart';
import 'package:mtg_companion/widgets/components/error_popup.dart';
import 'package:mtg_companion/widgets/components/home_screen/home_screen_filter_bar.dart';
import 'package:mtg_companion/widgets/components/home_screen/home_screen_card_scroll.dart';
import 'package:mtg_companion/widgets/components/home_screen/home_screen_page_control.dart';
import 'package:mtg_companion/widgets/components/throbber.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 1;
  List<MtgCard> _cards = [];
  List<String> sets = [];
  final SearchController _searchController = SearchController();
  bool _loadedCards = false;
  bool _loadedSets = false;
  bool _hasError = false;
  bool _notifiedConnection = false;
  String? _error;
  MtgCardFilters _filters = MtgCardFilters();

  //There's probably a better way of creating these setters
  void setName(String? value) {
    if (value != null && value != _filters.name) {
      _filters.name = value;
      setPage(1);
    }
  }

  void setType(String? value) {
    if (value != null && value != _filters.type) {
      _filters.type = value;
      setPage(1);
    }
  }

  void setRarity(String? value) {
    if (value != null && value != _filters.rarity) {
      _filters.rarity = value;
      setPage(1);
    }
  }

  void setSet(String? value) {
    if (value != null && value != _filters.set) {
      _filters.set = value;
      setPage(1);
    }
  }

  void clearFilters() {
    _filters.clear();
    setPage(1);
    _searchController.clear();
  }

  Future<void> setPage(int page) async {
    _currentPage = page;
    loadCards(page: _currentPage);
  }
  Future<void> loadSets() async
  {
    try {
      final List<MtgSet> _sets = await CardFetchingService.fetchSets();
      if(!mounted) return;
      for (MtgSet set in _sets) {
        sets.add(set.name);
      }
      setState(() {
        _loadedSets = true;
      });
    } catch (e, stack) {
  setState(() {
    _error = "${e.toString()}\n $stack";
    _hasError = true;
    _loadedSets = true;
  });
}
  }
  Future<void> loadCards({int page = 1}) async {
    setState(() {
      _loadedCards = false;
      _hasError = false;
    });
    try {
      final result = await CardFetchingService.fetchCards(
        page: page,
        filters: _filters,
      );
      if (!mounted) return;
      setState(() {
        _cards = result;
        _loadedCards = true;
        if (_cards.isEmpty) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("No cards found")));
        }
        if (!CardFetchingService.connected && !_notifiedConnection) {
          (ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("No internet connection"))));
          _notifiedConnection = true;
        }
      });
    } catch (e, stack) {
      setState(() {
        _error = "${e.toString()}\n $stack";
        _hasError = true;
        _loadedCards = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadCards(page: _currentPage);
    loadSets();

  }

  @override
  Widget build(BuildContext context) {
    bool lastPage = _cards.length < 100;
    return Scaffold(
      appBar: AppBar(title: Text("MTG Companion App"), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            SearchBar(
              controller: _searchController,
              hintText: "Search...",
              onSubmitted: (query) {
                setName(query);
              },
            ),
            HomeScreenFilterBar(
              sets: sets,
              onTypeSelected: (value) {
                setType(value);
              },
              onRaritySelected: (value) {
                setRarity(value);
              },
              onSetSelected: (value) {
                setSet(value);
              },
              onClear: () => clearFilters(),
              selectedType: _filters.type,
              selectedRarity: _filters.rarity,
              selectedSet: _filters.set,
            ),
            if (!_loadedCards || !_loadedSets)
              Expanded(child: Throbber())
            else if (_hasError)
              Expanded(
                child: ErrorPopup(
                  errorText: _error ?? '',
                  buttonText: "Ok",
                  buttonAction: () => clearFilters(),
                ),
              )
            else
              Expanded(child: HomeScreenCardScroll(cards: _cards)),
            HomeScreenPageControl(
              currentPage: _currentPage,
              onPressedBack: _currentPage <= 1
                  ? null
                  : () => setPage(_currentPage - 1),
              onPressedForward: lastPage
                  ? null
                  : () => setPage(_currentPage + 1),
            ),
          ],
        ),
      ),
    );
  }
}
