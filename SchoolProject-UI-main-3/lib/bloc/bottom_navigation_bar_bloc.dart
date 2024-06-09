import 'dart:async';

enum BottomNavBarEvent { home, favorites, visitations, getRoute }

class BottomNavBarBloc {
  int _currentIndex = 0;
  final _controller = StreamController<int>();

  Stream<int> get currentIndexStream => _controller.stream;

  void mapEventToIndex(BottomNavBarEvent event) {
    switch (event) {
      case BottomNavBarEvent.home:
        _updateIndex(0);
        break;
      case BottomNavBarEvent.favorites:
        _updateIndex(1);
        break;
      case BottomNavBarEvent.visitations:
        _updateIndex(2);
        break;
      case BottomNavBarEvent.getRoute:
        _updateIndex(3);
        break;
    }
  }

  void _updateIndex(int index) {
    _currentIndex = index;
    _controller.sink.add(_currentIndex);
  }

  void dispose() {
    _controller.close();
  }
}
