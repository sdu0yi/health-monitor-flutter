import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({Key? key, this.name, this.img}) : super(key: key);

  final String? name;
  final String? img;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
      child: Row(
        children: [
          const Icon(Icons.edit),
          Text(name ?? 'DefaultUser'),
          const Expanded(child: SizedBox()),
          Image.network(
            img ?? 'https://www.sdu.edu.cn/images/logo.png',
            width: 90.0,
            height: 90.0,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
