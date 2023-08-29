import 'package:universal_html/html.dart'  as html;

class SessionStorageHelper {

  static html.Storage sessionStorage = html.window.sessionStorage;

  static void saveValue(String key, String value) {
    sessionStorage[key] = value;
  }

  static String getValue(String key) {
    return sessionStorage[key] as String;
  }

  static void removeValue(String key) {
    sessionStorage.remove(key);
  }

  static void clearAll() {
    sessionStorage.clear();
  }
}