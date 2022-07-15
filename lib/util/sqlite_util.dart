import 'package:sqlite3/sqlite3.dart';

class SQLiteUtil{
  static late Database _instance;

  static Future initialize() async{
    _instance = sqlite3.openInMemory();
  }

  static Database get instance {
    return _instance;
  }
}