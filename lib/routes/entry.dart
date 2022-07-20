import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Entry extends StatelessWidget {
  const Entry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color.fromARGB(255, 96, 102, 112),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 120.0,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                '慢煮生活',
                style: TextStyle(
                    fontSize: 64.0,
                    color: Color.fromARGB(240, 250, 234, 157),
                    decoration: TextDecoration.none),
              ),
            ),
            const Text("美食与健康二者兼得",
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white70,
                    decoration: TextDecoration.none)),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LoginButton(
                  methodName: "手机号登录",
                  loginFunction: () {},
                  backgroundColor: const Color.fromARGB(255, 82, 86, 92),
                  textColor: Colors.white,
                  icon: Icons.phone_android_rounded,
                ),
                LoginButton(
                  methodName: "微信登录",
                  loginFunction: () {},
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  icon: Icons.wechat,
                ),
                LoginButton(
                  methodName: "QQ登录",
                  loginFunction: () {},
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                  icon: Icons.question_answer_outlined,
                )
              ],
            )),
            SizedBox(
              height: 120,
              child: RightsText(),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton(
      {Key? key,
      required this.methodName,
      required this.loginFunction,
      required this.backgroundColor,
      required this.textColor,
      required this.icon})
      : super(key: key);

  final String methodName;
  final VoidCallback loginFunction;
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      width: 220.0,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            padding: MaterialStateProperty.all(const EdgeInsets.all(10.0)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)))),
        onPressed: loginFunction,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(
              width: 5.0,
            ),
            Text(methodName,
                style: TextStyle(
                    fontSize: 14.0,
                    color: textColor,
                    decoration: TextDecoration.none))
          ],
        ),
      ),
    );
  }
}

class RightsText extends StatefulWidget {
  const RightsText({Key? key}) : super(key: key);

  @override
  State<RightsText> createState() => _RightsTextState();
}

class _RightsTextState extends State<RightsText> {
  final _value = '1';
  String? _groupValue = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 40,
          child: Radio(
            value: _value,
            groupValue: _groupValue,
            onChanged: (String? value) {
              setState(() {
                _groupValue = value;
              });
            },
          ),
        ),
        Container(
          width: 220.0,
          child: RichText(
            text: TextSpan(
                style: const TextStyle(
                    fontSize: 10.0,
                    color: Colors.white60,
                    decoration: TextDecoration.none),
                children: <InlineSpan>[
                  const TextSpan(text: '我已阅读并同意'),
                  TextSpan(
                    text: '《用户协议》（隐私政策）',
                    style: const TextStyle(color: Colors.lightBlueAccent),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                  const TextSpan(text: '以及'),
                  TextSpan(
                    text: '《儿童/青少年个人信息保护规则》',
                    style: const TextStyle(color: Colors.lightBlueAccent),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ]),
          ),
        )
      ],
    );
  }
}

/*
Container(
          width: 280.0,
          //padding: const EdgeInsets.all(30.0),
          //margin: const EdgeInsets.only(top: 40),
          child: RichText(
            text: TextSpan(
                style: const TextStyle(
                    fontSize: 10.0,
                    color: Colors.white60,
                    decoration: TextDecoration.none),
                children: <InlineSpan>[
                  const TextSpan(text: '我已阅读并同意'),
                  TextSpan(
                    text: '《用户协议》（隐私政策）',
                    style: const TextStyle(color: Colors.lightBlueAccent),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                  const TextSpan(text: '以及'),
                  TextSpan(
                    text: '《儿童/青少年个人信息保护规则》',
                    style: const TextStyle(color: Colors.lightBlueAccent),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ]),
          ),
        )

 */
