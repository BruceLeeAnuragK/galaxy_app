import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:galaxy_app/model/solar_system_model.dart';
import 'package:galaxy_app/utills/my_controllers.dart';

class PlanetProvider extends ChangeNotifier {
  List<Planets> AllPlanets = [];
  PlanetProvider() {
    loadJSONPLANET();
  }
  loadJSONPLANET() async {
    String planets =
        await rootBundle.loadString("assets/json/solar_system.json");
    List allplanets = jsonDecode(planets);
    AllPlanets = allplanets.map((e) => Planets.fromJson(json: e)).toList();
    print("**********************");
    print(AllPlanets.length);
    print(AllPlanets[0].name);
    print(AllPlanets[0].distance);
    print(AllPlanets[0].image);
    print("**********************");
  }
}
//{"position": "9",
//  "name": "Sun",
//  "image": "http://pngimg.com/uploads/sun/sun_PNG13424.png",
//  "velocity": "220",
//  "distance": "0",
//  "description": "The Sun (or Sol), is the star at the centre of our solar system and is responsible for the Earth’s climate and weather. The Sun is an almost perfect sphere with a difference of just 10km in diameter between the poles and the equator. The average radius of the Sun is 695,508 km (109.2 x that of the Earth) of which 20–25% is the core."
//}
