import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hello'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 30.0, top: 30.0),
                child: const Text(
                  '手机验证码登录',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400),
                ),
              ),
              const Divider(height: 30.0),
              const LoginForm(),
              SizedBox(
                height: 100.0,
                child: Center(
                  child: SizedBox(
                    width: 160.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.67))),
                      ),
                      onPressed: () {},
                      child: const Text('手机号登录'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 100.0),
              const SizedBox(
                width: double.infinity,
                child: OtherLoginMethod(),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.only(top: 20.0),
                child: const Text('All rights reserved'),
              )
            ],
          ),
        ));
  }
}

class OtherLoginMethod extends StatefulWidget {
  const OtherLoginMethod({Key? key}) : super(key: key);

  @override
  State<OtherLoginMethod> createState() => _OtherLoginMethodState();
}

class _OtherLoginMethodState extends State<OtherLoginMethod> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          width: double.infinity,
          child: const Text("其他登录方式"),
        ),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                color: Colors.yellow,
                height: 80.0,
                width: 80.0,
                child: const Text('微信登录'),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                color: Colors.yellow,
                height: 80.0,
                width: 80.0,
                child: const Text('QQ登录'),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                color: Colors.yellow,
                height: 80.0,
                width: 80.0,
                child: const Text('统一认证'),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          height: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              SizedBox(width: 90, child: ZoneSelector()),
              SizedBox(
                width: 160.0,
                child: TextField(),
              ),
              SizedBox(
                width: 10.0,
              ),
              ElevatedButton(onPressed: _getVerifyNumber, child: Text('获取验证码'))
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          height: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              SizedBox(
                width: 90,
                child: Text(
                  '输入验证码',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              SizedBox(
                width: 160.0,
                child: TextField(),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ZoneSelector extends StatefulWidget {
  const ZoneSelector({Key? key}) : super(key: key);

  @override
  State<ZoneSelector> createState() => _ZoneSelectorState();
}

class _ZoneSelectorState extends State<ZoneSelector> {
  String _currentZone = '+86';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      width: 70.0,
      child: Center(
        child: PopupMenuButton<String>(
          initialValue: '+86',
          itemBuilder: (context) {
            return <PopupMenuEntry<String>>[
              const PopupMenuItem(value: '+86', child: Text('+86')),
              const PopupMenuItem(value: '+826', child: Text('+26'))
            ];
          },
          child: Text(
            _currentZone,
            style: const TextStyle(fontSize: 18.0),
          ),
          onSelected: (value) {
            setState(() {
              _currentZone = value;
            });
          },
        ),
      ),
    );
  }
}

_getVerifyNumber() {}
