import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtil {
  static get token => 'token';

  static get refreshToken => 'refreshToken';

  static late SharedPreferences _instance;

  static Future initialize() async {
    _instance = await SharedPreferences.getInstance();
  }

  static SharedPreferences get instance {
    return _instance;
  }
}
