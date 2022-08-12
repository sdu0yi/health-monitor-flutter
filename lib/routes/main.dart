import 'package:flutter/material.dart';
import 'package:heal_monitor_flutter/routes/cookbook_menu.dart';
import 'package:heal_monitor_flutter/routes/ingredient_menu.dart';
import 'package:heal_monitor_flutter/routes/user_info.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;
  final List<Widget> _pages = [];

  @override
  void initState() {
    _pages
      ..add(const CookbookMenu())
      ..add(const IngredientMenu())
      ..add(const UserInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final double iconSize = IconTheme.of(context).size ?? 24;
    final double iconSize = 36;
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      // floatingActionButton: _currentIndex == 1
      //     ? IngredientFloatingButton(pressedFunction: () {})
      //     : null,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Image(
                image: const AssetImage("icons/home0.png"),
                height: iconSize,
                width: iconSize,
                color: Colors.black,
              ),
              activeIcon: Image(
                image: const AssetImage("icons/home1.png"),
                height: iconSize,
                width: iconSize,
                color: Colors.black,
              ),
              label: '菜谱',
              ),
          BottomNavigationBarItem(
              icon: Image(
                image: const AssetImage("icons/食材0.png"),
                height: iconSize,
                width: iconSize,
                color: Colors.black,
              ),
              activeIcon: Image(
                image: const AssetImage("icons/食材1.png"),
                height: iconSize,
                width: iconSize,
                color: Colors.black,
              ),
              label: '食材'
              ),
          BottomNavigationBarItem(
              icon: Image(
                image: const AssetImage("icons/user0.png"),
                height: iconSize,
                width: iconSize,
                color: Colors.black,
              ),
              activeIcon: Image(
                image: const AssetImage("icons/user1.png"),
                height: iconSize,
                width: iconSize,
                color: Colors.black,
              ),
              label: '个人中心'
          )
        ],
      ),
    );
  }
}
