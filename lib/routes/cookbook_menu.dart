import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heal_monitor_flutter/widgets/cookbook_item.dart';
import 'package:heal_monitor_flutter/widgets/search_bar.dart';

class CookbookMenu extends StatefulWidget {
  const CookbookMenu({Key? key}) : super(key: key);

  @override
  State<CookbookMenu> createState() => _CookbookMenuState();
}

class _CookbookMenuState extends State<CookbookMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 60.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child:  SearchBar(),
        ),
        Expanded(
            child: Container(
          padding: const EdgeInsets.all(5.0),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10.0),
            children: const [
              CookbookItem(
                  img:
                      'https://pica.zhimg.com/50/v2-49fc7bbc3017e27c46fc56b2e17ad5df_720w.jpg?source=1940ef5c',
                  name: 'Hello'),
              CookbookItem(
                  img:
                      'https://pica.zhimg.com/50/v2-49fc7bbc3017e27c46fc56b2e17ad5df_720w.jpg?source=1940ef5c',
                  name: 'Hello'),
              CookbookItem(
                  img:
                      'https://pica.zhimg.com/50/v2-49fc7bbc3017e27c46fc56b2e17ad5df_720w.jpg?source=1940ef5c',
                  name: 'Hello'),
              CookbookItem(
                  img:
                      'https://pica.zhimg.com/50/v2-49fc7bbc3017e27c46fc56b2e17ad5df_720w.jpg?source=1940ef5c',
                  name: 'Hello'),
              CookbookItem(
                  img:
                      'https://pica.zhimg.com/50/v2-49fc7bbc3017e27c46fc56b2e17ad5df_720w.jpg?source=1940ef5c',
                  name: 'Hello'),
              CookbookItem(
                  img:
                      'https://pica.zhimg.com/50/v2-49fc7bbc3017e27c46fc56b2e17ad5df_720w.jpg?source=1940ef5c',
                  name: 'Hello'),
              CookbookItem(
                  img:
                      'https://pica.zhimg.com/50/v2-49fc7bbc3017e27c46fc56b2e17ad5df_720w.jpg?source=1940ef5c',
                  name: 'Hello'),
              CookbookItem(
                  img:
                      'https://pica.zhimg.com/50/v2-49fc7bbc3017e27c46fc56b2e17ad5df_720w.jpg?source=1940ef5c',
                  name: 'Hello'),
            ],
          ),
        ))
      ],
    );
  }
}
