
import 'package:flutter/material.dart';
import 'package:heal_monitor_flutter/routes/entry.dart';
import 'package:heal_monitor_flutter/util/log_util.dart';
import 'package:heal_monitor_flutter/util/network_util.dart';
import 'package:heal_monitor_flutter/util/shared_preference_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  runApp(const MyApp());
}

Future<void> initialize() async {
  await Future.wait([
    SharedPreferenceUtil.initialize(),
    // SQLiteUtil.initialize(),
    LogUtil.initialize(),
    NetworkUtil.initialize(headers: {
      'User-Agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'
    })
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: const ColorScheme.light()
              .copyWith(primary: const Color.fromARGB(255, 96, 102, 112))),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Entry();
  }
}
