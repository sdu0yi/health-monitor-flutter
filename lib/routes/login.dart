import 'package:flutter/material.dart';
import 'package:heal_monitor_flutter/routes/main.dart';

import '../util/network_util.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hello'),
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
                  '用户登录',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400),
                ),
              ),
              const Divider(height: 30.0),
              const LoginForm(),
              const Expanded(
                  child: SizedBox(
                width: double.infinity,
              )),
              //-----------------------------------------------
              //其他登录
              //-----------------------------------------------
              // const SizedBox(
              //   width: double.infinity,
              //   child: OtherLoginMethod(),
              // ),
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

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          height: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                width: 90,
                child: Text(
                  '用户名',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              SizedBox(
                width: 160.0,
                child: TextField(
                  decoration: const InputDecoration(labelText: 'account'),
                  controller: _usernameController,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          height: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                width: 90,
                child: Text(
                  '密码',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              SizedBox(
                width: 160.0,
                child: TextField(
                  decoration: const InputDecoration(labelText: 'password'),
                  controller: _passwordController,
                ),
              )
            ],
          ),
        ),
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
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (builder) {
                     return _getUserLogin(
                        _usernameController.text, _passwordController.text);
                  }));
                },
                child: const Text('登录'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

_getUserLogin(String username, String password) async {
  var response = await NetworkUtil.instance.get('/login',
      queryParameters: {"username": username, 'password': password});
  if (response.statusCode == 200){
    return Main();
  }
  return Login();
}

//
// class ZoneSelector extends StatefulWidget {
//   const ZoneSelector({Key? key}) : super(key: key);
//
//   @override
//   State<ZoneSelector> createState() => _ZoneSelectorState();
// }
//
// class _ZoneSelectorState extends State<ZoneSelector> {
//   String _currentZone = '+86';
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 40.0,
//       width: 70.0,
//       child: Center(
//         child: PopupMenuButton<String>(
//           initialValue: '+86',
//           itemBuilder: (context) {
//             return <PopupMenuEntry<String>>[
//               const PopupMenuItem(value: '+86', child: Text('+86')),
//               const PopupMenuItem(value: '+826', child: Text('+26'))
//             ];
//           },
//           child: Text(
//             _currentZone,
//             style: const TextStyle(fontSize: 18.0),
//           ),
//           onSelected: (value) {
//             setState(() {
//               _currentZone = value;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }
//
// _getVerifyNumber() {}
//
// class OtherLoginMethod extends StatefulWidget {
//   const OtherLoginMethod({Key? key}) : super(key: key);
//
//   @override
//   State<OtherLoginMethod> createState() => _OtherLoginMethodState();
// }
//
// class _OtherLoginMethodState extends State<OtherLoginMethod> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         Container(
//           padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//           width: double.infinity,
//           child: const Text("其他登录方式"),
//         ),
//         SizedBox(
//           width: double.infinity,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(10.0),
//                 margin: const EdgeInsets.symmetric(horizontal: 10.0),
//                 height: 80.0,
//                 width: 80.0,
//                 child: const Image(
//                   image: AssetImage("icons/微信.png"),
//                   color: Colors.green,
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.all(10.0),
//                 margin: const EdgeInsets.symmetric(horizontal: 10.0),
//                 height: 80.0,
//                 width: 80.0,
//                 child: const Image(
//                   image: AssetImage("icons/QQ.png"),
//                   color: Colors.blue,
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.all(10.0),
//                 margin: const EdgeInsets.symmetric(horizontal: 10.0),
//                 height: 80.0,
//                 width: 80.0,
//                 child: const Image(
//                   image: AssetImage("icons/山大.png"),
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
