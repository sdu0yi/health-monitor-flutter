import 'package:flutter/material.dart';
import 'package:heal_monitor_flutter/model/ingredient.dart';
import 'package:heal_monitor_flutter/util/network_util.dart';
import 'package:heal_monitor_flutter/widgets/ingredient_item.dart';
import 'package:heal_monitor_flutter/widgets/search_bar.dart';
import 'package:logger/logger.dart';

import '../model/response_wrapper.dart';

class IngredientMenu extends StatefulWidget {
  const IngredientMenu({Key? key}) : super(key: key);

  @override
  State<IngredientMenu> createState() => _IngredientMenuState();
}

class _IngredientMenuState extends State<IngredientMenu> {
  static const int _pageSize = 20;
  int _page = 0;
  bool _more = true;
  String? _query;
  var _ingredientList = <Ingredient>[];
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _requestData();
    _controller.addListener(() {
      Logger().d(_controller.position.pixels);
      Logger().d(_controller.position.maxScrollExtent);
      if (_controller.position.pixels - _controller.position.maxScrollExtent <
          20) {
        if (_more) {
          _requestData();
        }
      }
    });
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
          child: SearchBar(),
        ),
        Expanded(
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: _ingredientList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: _refreshData,
                    child: ListView.builder(
                        controller: _controller,
                        itemCount: _ingredientList.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (index >= _ingredientList.length) {
                            return Column(
                              children: [
                                IngredientItem(
                                  name: _ingredientList[index].iname,
                                ),
                                const Divider(),
                                const CircularProgressIndicator()
                              ],
                            );
                          } else {
                            return IngredientItem(
                              name: _ingredientList[index].iname,
                            );
                          }
                        })),
          ),
        )
      ],
    );
  }

  Future<void> _refreshData() async {
    _page = 0;
    Logger().i('REFRESH DATA');
  }

  _requestData() async {
    var response = await NetworkUtil.instance.get('/ingredient/getlist',
        queryParameters: {
          "page_size": _pageSize,
          'page': _page,
          'query': _query ?? ''
        });
    if (response.statusCode == 200) {
      setState(() {
        ResponseWrapper responseData = ResponseWrapper.fromJson(response.data);
        List<Ingredient> responseList = [];
        responseData.datas?.forEach((element) {
          responseList.add(Ingredient.fromJson(element));
          Logger().i(Ingredient.fromJson(element));
        });

        _page == 0
            ? _ingredientList = responseList
            : _ingredientList.addAll(responseList);
        _page++;
        if (responseList.length < _pageSize) {
          _more = false;
        }
      });
    }
  }
}
