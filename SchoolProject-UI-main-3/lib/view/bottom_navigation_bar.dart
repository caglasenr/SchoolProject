import 'package:edirne_gezgini_ui/bloc/bottom_navigation_bar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:edirne_gezgini_ui/view/favorites_page.dart';
import 'package:edirne_gezgini_ui/view/get_route_page.dart';
import 'package:edirne_gezgini_ui/view/home_page.dart';
import 'package:edirne_gezgini_ui/view/visitations_page.dart';
import 'package:edirne_gezgini_ui/constants.dart' as constants;



class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final BottomNavBarBloc _bloc = BottomNavBarBloc();
  int _currentIndex = 0;

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: StreamBuilder<int>(
        stream: _bloc.currentIndexStream,
        initialData: 0,
        builder: (context, snapshot) {
          int? currentIndex = snapshot.data;
          return Scaffold(
            body: IndexedStack(
              index: currentIndex ?? 0,
              children: const [
                HomePage(),
                FavoritePage(),
                VisitationsPage(),
                GetRoutePage(),
              ],
            ),
            bottomNavigationBar: NavigationBar(
              destinations: const [
                NavigationDestination(
                  iconData: Icons.home_outlined,
                  label: "Ana Sayfa",
                ),
                NavigationDestination(
                  iconData: Icons.favorite_border,
                  label: "Favorilerim",
                ),
                NavigationDestination(
                  iconData: Icons.location_on_outlined,
                  label: "Gittiğim Yerler",
                ),
                NavigationDestination(
                  iconData: Icons.map_outlined,
                  label: "Rota Göster",
                ),
              ],
              indicatorColor: constants.bottomNavBarColor.withOpacity(0.9),
              selectedIndex: _currentIndex,
              elevation: 0,
              onDestinationSelected: (int index) {
                _bloc.mapEventToIndex(_mapIndexToEvent(index));
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          );
        },
      ),
    );
  }

  BottomNavBarEvent _mapIndexToEvent(int index) {
    switch (index) {
      case 0:
        return BottomNavBarEvent.home;
      case 1:
        return BottomNavBarEvent.favorites;
      case 2:
        return BottomNavBarEvent.visitations;
      case 3:
        return BottomNavBarEvent.getRoute;
      default:
        throw Exception("Invalid index");
    }
  }
}

class NavigationBar extends StatefulWidget {
  final List<NavigationDestination> destinations;
  final Color indicatorColor;
  final int selectedIndex;
  final double elevation;
  final Function(int) onDestinationSelected;

  const NavigationBar({
    Key? key,
    required this.destinations,
    required this.indicatorColor,
    required this.selectedIndex,
    required this.elevation,
    required this.onDestinationSelected,
  }) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: widget.destinations
          .map((destination) => BottomNavigationBarItem(
        icon: Icon(destination.iconData),
        label: destination.label,
      ))
          .toList(),
      currentIndex: widget.selectedIndex,
      selectedItemColor: widget.indicatorColor,
      elevation: widget.elevation,
      onTap: widget.onDestinationSelected,
    );
  }
}

class NavigationDestination {
  final IconData iconData;
  final String label;

  const NavigationDestination({
    required this.iconData,
    required this.label,
  });
}
