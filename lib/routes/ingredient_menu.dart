import 'package:flutter/cupertino.dart';
import 'package:heal_monitor_flutter/widgets/ingredient_item.dart';

class IngredientMenu extends StatefulWidget {
  const IngredientMenu({Key? key}) : super(key: key);

  @override
  State<IngredientMenu> createState() => _IngredientMenuState();
}

class _IngredientMenuState extends State<IngredientMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 60.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: const Text(
            'SearchBar',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        Expanded(
            child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: ListView(
            children: const [IngredientItem()],
          ),
        ))
      ],
    );
  }
}
