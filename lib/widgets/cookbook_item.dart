import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CookbookItem extends StatefulWidget {
  const CookbookItem({Key? key, this.img, required this.name})
      : super(key: key);

  final String? img;
  final String? name;

  @override
  State<CookbookItem> createState() => _CookbookItemState();
}

class _CookbookItemState extends State<CookbookItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(5.0),
      decoration: const BoxDecoration(border: Border()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            widget.img ?? '',
            height: 140.0,
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          const Divider(height: 10.0),
          Text(
            widget.name ?? 'Empty',
            style: const TextStyle(fontSize: 18.0),
          )
        ],
      ),
    );
  }
}
