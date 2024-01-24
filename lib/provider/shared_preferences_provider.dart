import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePrefProvider with ChangeNotifier {
  final SharedPreferences prefs;
  List<dynamic> StroredPlanetsList = [];
  SharePrefProvider(this.prefs);
  String storedPlanet = "";
  Future<void> savePlanet(
      {required String key, required String planets}) async {
    print("Planet: $planets will be saved...");
    print("SF initialized....");
    if (await prefs.setString(key, planets)) {
      print("Planets saved//////////////////////////////////");
    } else {
      print("Planets not saved//////////////////////////////////");
    }
    notifyListeners();
  }

  void retrievePlanet({required String key}) {
    String retrieved = prefs.getString(key) ?? "";
    print("Planet $key retrieved: $retrieved");
    storedPlanet = retrieved;

    notifyListeners();
  }

  Future<void> clearPlanet() async {
    await prefs.clear();
    print("Planets cleared");
    notifyListeners();
  }
}
