import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heal_monitor_flutter/model/collection.dart';
import 'package:heal_monitor_flutter/widgets/cookbook_item.dart';
import 'package:heal_monitor_flutter/widgets/search_bar.dart';
import 'package:heal_monitor_flutter/util/network_util.dart';
import 'package:heal_monitor_flutter/widgets/cart_item.dart';
import 'package:logger/logger.dart';

import '../model/response_wrapper.dart';

class CartNotification extends Notification {
  CartNotification({required this.cid, required this.cname});

  final int? cid;
  final String? cname;
}

class CookbookMenu extends StatefulWidget {
  const CookbookMenu({Key? key}) : super(key: key);

  @override
  State<CookbookMenu> createState() => _CookbookMenuState();
}

class _CookbookMenuState extends State<CookbookMenu> {
  static const int _pageSize = 20;
  int _page = 0;
  String? _query;
  var _cookBookList = <Collection>[];
  bool _needMore = true;
  final ScrollController _controller = ScrollController();
  List<CartItem> cartList = <CartItem>[];

  @override
  void initState() {
    _requestData();
    _controller.addListener(() {
      // Logger().d(
      //     'Pixel: ${_controller.position.pixels}; Max Pixel: ${_controller.position.maxScrollExtent}');
      if (_controller.position.maxScrollExtent - _controller.position.pixels < 200) {
        if (_needMore) {
          Logger().d('请求数据, page: $_page');
          _requestData();
          _needMore = false;
        }
      }
    });
    cartList = [];
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
          child:  SearchBar(),
        ),
        Expanded(
          child: Container(
            padding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: NotificationListener(
              onNotification: (CartNotification notification) {
                cartList.add(CartItem(
                    name: notification.cname ?? 'Empty',
                    id: notification.cid ?? 0));
                return true;
              },
              child: _cookBookList.isEmpty
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : RefreshIndicator(
                onRefresh: _refreshData,
                child: ListView.builder(
                  controller: _controller,
                  itemCount: _cookBookList.length,
                  itemBuilder: (BuildContext context, int index) {
                    // 判断是否需要更新数据
                    if (_cookBookList.length - index <= 2) {
                      _needMore = true;
                    }
                    if (index == _cookBookList.length - 1) {
                      return Column(
                        children: [
                          CookbookItem(
                            img:
                            '${_cookBookList[index].cphoto}',
                            name:
                            '${_cookBookList[index].cname}',
                          ),
                          const Divider(),
                          const CircularProgressIndicator()
                        ],
                      );
                    } else {
                      return CookbookItem(
                        img:
                        '${_cookBookList[index].cphoto}',
                        name:
                        '${_cookBookList[index].cname}',
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<void> _refreshData() async {
    _page = 0;
    Logger().i('重置数据');
    _cookBookList = <Collection>[];
    _requestData();
  }

  _requestData() async {
    var response = await NetworkUtil.instance.get('/cookBook/getlist',
        queryParameters: {
          "page_size": _pageSize,
          'page': _page,
          'query': _query ?? ''
        });
    if (response.statusCode == 200) {
      setState(() {
        ResponseWrapper responseData = ResponseWrapper.fromJson(response.data);
        List<Collection> responseList = [];
        responseData.datas?.forEach((element) {
          responseList.add(Collection.fromJson(element));
          // Logger().i(Collection.fromJson(element));
        });

        _page == 0
            ? _cookBookList = responseList
            : _cookBookList.addAll(responseList);
        Logger().d(_cookBookList.length);

        _page++;
      });
    }
  }

}
