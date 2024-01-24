import 'package:flutter/material.dart';
import 'package:galaxy_app/provider/planet_provider.dart';
import 'package:galaxy_app/provider/shared_preferences_provider.dart';
import 'package:galaxy_app/view/screen/Info_List%20_of_page.dart';
import 'package:galaxy_app/view/screen/boomark_screen.dart';
import 'package:galaxy_app/view/screen/home_page.dart';
import 'package:galaxy_app/view/screen/list_of_planets.dart';
import 'package:galaxy_app/view/screen/planet_detail_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PlanetProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SharePrefProvider(prefs),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splash_screen",
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        "splash_screen": (context) => SplashScreen(),
        "/": (context) => PlanetListPage(),
        "Detail": (context) => PlanetDetailPage(),
        "Info_List_of_page": (context) => InfoListPage(),
        "bookmark_screen": (context) => BookmarkScreen(),
      },
    );
  }
}
