import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heal_monitor_flutter/widgets/cart_item.dart';

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            decoration: const BoxDecoration(color: Colors.amber),
            child: const Center(
              child: Text(
                '已选食材',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ),
          //Expanded(child: ListView.builder(itemBuilder: (context, int index) {
          //  return Text('$index');
          //})),
          SizedBox(
            height: 180.0,
            child: ListView(
              padding: const EdgeInsets.only(top: 0.0),
              children: const [CartItem(), CartItem(), CartItem(),CartItem()],
            ),
          ),
          Container(
            color: Colors.white,
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 3.0),
            child: Row(
              children: [
                const Text(
                  '以上为您的所选食材',
                  style: TextStyle(fontSize: 16.0, color: Colors.black87),
                ),
                Expanded(child: Container()),
                SizedBox(
                  width: 100.0,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('去看食谱')),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
