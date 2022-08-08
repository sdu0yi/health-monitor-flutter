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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: SizedBox.fromSize(
              size: const Size.fromRadius(82),
              child: Image.network(
                widget.img ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(children: [
            const SizedBox(
              width: 20.0,
            ),
            Text(
              widget.name ?? 'Empty',
              style: const TextStyle(fontSize: 18.0),
              overflow: TextOverflow.fade,
            )
          ])
        ],
      ),
    );
  }
}
