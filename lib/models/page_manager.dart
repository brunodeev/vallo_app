import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';

class PageManager extends ChangeNotifier {
  int _currentTab = 0;
  final List<Widget> _screens = const [HomeScreen(), ProfileScreen()];

  set currentTab(int tab) {
    _currentTab = tab;
    notifyListeners();
  }

  int get currentTab => _currentTab;
  get currentScreen => _screens[_currentTab];
}
