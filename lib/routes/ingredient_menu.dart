import 'package:flutter/material.dart';
import 'package:heal_monitor_flutter/model/ingredient.dart';
import 'package:heal_monitor_flutter/util/network_util.dart';
import 'package:heal_monitor_flutter/widgets/cart_list.dart';
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
  bool _needMore = true;
  bool _showBottom = true;
  String? _query;
  var _ingredientList = <Ingredient>[];
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _requestData();
    _controller.addListener(() {
      // Logger().d(
      //     'Pixel: ${_controller.position.pixels}; Max Pixel: ${_controller.position.maxScrollExtent}');
      if (_controller.position.maxScrollExtent - _controller.position.pixels <
          200) {
        if (_needMore) {
          Logger().d('请求数据, page: $_page');
          _requestData();
          _needMore = false;
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
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
                              // 判断是否需要更新数据
                              if (_ingredientList.length - index <= 2) {
                                _needMore = true;
                              }
                              if (index == _ingredientList.length - 1) {
                                return Column(
                                  children: [
                                    IngredientItem(
                                      name:
                                          '${_ingredientList[index].iname}, iid: ${_ingredientList[index].iid}',
                                    ),
                                    const Divider(),
                                    const CircularProgressIndicator()
                                  ],
                                );
                              } else {
                                return IngredientItem(
                                  name:
                                      '${_ingredientList[index].iname}, iid: ${_ingredientList[index].iid}',
                                );
                              }
                            })),
              ),
            )
          ],
        ),
        Positioned(
            child: _showBottom
                ? Container(
                    color: const Color.fromARGB(174, 72, 72, 72),
                  )
                : Container()),
        Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: _showBottom ? const CartList() : Container())
      ],
    );
  }

  Future<void> _refreshData() async {
    _page = 0;
    Logger().i('重置数据');
    _ingredientList = <Ingredient>[];
    _requestData();
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
          // Logger().i(Ingredient.fromJson(element));
        });

        _page == 0
            ? _ingredientList = responseList
            : _ingredientList.addAll(responseList);
        Logger().d(_ingredientList.length);

        _page++;
      });
    }
  }
}
