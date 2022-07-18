import 'package:logger/logger.dart';

class LogUtil {
  static late Logger _instance;

  static Future initialize() async {
    _instance = Logger();
  }

  static Logger get instance {
    return _instance;
  }
}
