import 'package:flutter/material.dart';

class UserInfoItem extends StatelessWidget {
  const UserInfoItem({Key? key, this.content, this.icon}) : super(key: key);

  final String? content;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      child: Row(children: [
        Text(content ?? 'default'),
        const Expanded(
          child: SizedBox(),
        ),
        Icon(icon ?? Icons.star)
      ]),
    );
  }
}
