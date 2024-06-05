import 'package:flutter/material.dart';

ValueNotifier<int> IndexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_literals_to_create_immutables
    return ValueListenableBuilder(
      valueListenable: IndexChangeNotifier,
      builder: (context, int newindex, _) {
        return BottomNavigationBar(
            currentIndex: newindex,
            onTap: (index) {
              IndexChangeNotifier.value = index;
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            backgroundColor: Colors.black,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.collections), label: 'New & Hot'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_emotions), label: 'Fast Laugh'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.download), label: 'Downloads'),
            ]);
      },
    );
  }
}
