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
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox.fromSize(
                size: const Size.fromRadius(180),
                child: Image.network(
                  widget.img ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            height: 30.0,
            margin: const EdgeInsets.only(top: 2.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    widget.name ?? 'Empty',
                    style: const TextStyle(fontSize: 18.0),
                    overflow: TextOverflow.fade,
                  )
                ]),
          )
        ],
      ),
    );
  }
}
