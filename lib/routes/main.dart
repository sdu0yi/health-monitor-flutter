import 'package:flutter/material.dart';
import 'package:heal_monitor_flutter/routes/cookbook_menu.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;
   List<Widget> _pages = [];

  @override
  void initState() {
    _pages.add(const CookbookMenu());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: '菜谱'),
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: '食材'),
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: '个人中心')
        ],
      ),
    );
  }
}
