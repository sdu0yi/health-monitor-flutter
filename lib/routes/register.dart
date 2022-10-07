import 'package:flutter/material.dart';
import 'package:heal_monitor_flutter/routes/login.dart';
import 'package:heal_monitor_flutter/routes/main.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

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
                  '用户注册',
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
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (builder) {
                          return Login();
                        }));
                      },
                      child: const Text('注   册'),
                    ),
                  ),
                ),
              ),
              const Expanded(
                  child: SizedBox(
                    width: double.infinity,
                  )),
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
            children: const <Widget>[
              SizedBox(
                width: 90,
                child: Text(
                  '用户名',
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
                  '密码',
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
                  '确认密码',
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
