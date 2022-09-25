import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, this.url, required this.name, required this.id})
      : super(key: key);

  final String? url;
  final String name;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
        height: 80.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              url ?? 'https://book.flutterchina.club/assets/img/logo.png',
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              width: 120.0,
              child: Text(
                name,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              width: 40.0,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
              ),
            )
          ],
        ));
  }
}
