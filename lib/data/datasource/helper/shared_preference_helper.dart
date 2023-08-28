import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  Future<String> saveHistorySearch(List<String> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("saveHistory", data);
    return "Saved";
  }

  Future<List<String>> getHistorySearch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList("saveHistory") ?? [];
  }

  Future<void> removeHistorySearch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("saveHistory");
  }
}
