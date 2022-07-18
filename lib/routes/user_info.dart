import 'package:flutter/material.dart';
import 'package:heal_monitor_flutter/widgets/user_header.dart';
import 'package:heal_monitor_flutter/widgets/user_info_item.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 60.0,
          ),
          const SizedBox(
            height: 160.0,
            child: Center(
              child: UserHeader(),
            ),
          ),
          const Divider(height: 10.0),
          Expanded(
            child: Column(
              children: const [UserInfoItem(), UserInfoItem()],
            ),
          ),
          const SizedBox(
            height: 120,
            child: LogoutButton(),
          )
        ],
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0))),
      ),
      onPressed: () {},
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
        child: const Text(
          "退出",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    ));
  }
}
