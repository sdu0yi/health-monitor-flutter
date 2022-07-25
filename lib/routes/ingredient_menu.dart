
import 'package:flutter/cupertino.dart';
import 'package:heal_monitor_flutter/model/ingredient.dart';
import 'package:heal_monitor_flutter/util/network_util.dart';
import 'package:heal_monitor_flutter/widgets/ingredient_item.dart';
import 'package:logger/logger.dart';

import '../model/response_wrapper.dart';

class IngredientMenu extends StatefulWidget {
  const IngredientMenu({Key? key}) : super(key: key);

  @override
  State<IngredientMenu> createState() => _IngredientMenuState();
}

class _IngredientMenuState extends State<IngredientMenu> {
  @override
  void initState() {
    refreshData();
    super.initState();
  }

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

Future<void> refreshData() async {
  var response = await NetworkUtil.instance.get('/ingredient/getlist',
      queryParameters: {"page_size": 20, 'page': 1, 'query': ''});
  // var responseJson = jsonDecode(response.data);
  Logger()
      .d('CODE: ${response.statusCode}, MESSAGE: ${response.statusMessage}');
  ResponseWrapper ds = ResponseWrapper.fromJson(response.data);
  Logger().d(ds);
  List<Ingredient>? list;
  for (var element in ds.datas!) {
    list?.add(Ingredient.fromJson(element));
    Logger().d(Ingredient.fromJson(element));
  }
}
