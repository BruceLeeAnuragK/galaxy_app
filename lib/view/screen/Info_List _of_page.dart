import 'dart:math';

import 'package:flutter/material.dart';
import 'package:galaxy_app/provider/shared_preferences_provider.dart';
import 'package:provider/provider.dart';

import '../../provider/planet_provider.dart';

class InfoListPage extends StatefulWidget {
  const InfoListPage({Key? key}) : super(key: key);

  @override
  State<InfoListPage> createState() => _InfoListPageState();
}

class _InfoListPageState extends State<InfoListPage>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController mercuryanimationController;
  late AnimationController venusanimationController;
  late AnimationController earthanimationController;
  late AnimationController marsanimationController;
  late AnimationController jupitaranimationController;
  late AnimationController saturnanimationController;
  late AnimationController UranusanimationController;
  late AnimationController neptuneanimationController;
  late Animation angle;
  late Animation position;
  late Animation opacity;
  late List<AnimationController> planetControllers;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 10,
      ),
    )..forward();
    mercuryanimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 40,
      ),
    )..forward();
    venusanimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 60,
      ),
    )..forward();
    earthanimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 80,
      ),
    )..forward();
    marsanimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 100,
      ),
    )..forward();

    jupitaranimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 120,
      ),
    )..forward();
    saturnanimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 140,
      ),
    )..forward();
    UranusanimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 160,
      ),
    )..forward();

    neptuneanimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 180,
      ),
    )..forward();

    angle = Tween<double>(
      begin: 0.0,
      end: (pi * 2).toDouble(),
    ).animate(
      animationController,
    );
    animationController.repeat();
    opacity = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.5, 1.0),
      ),
    );

    position = Tween(
      begin: 100.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: const Interval(
          0.0,
          0.5,
        ),
      ),
    );
    planetControllers = [
      mercuryanimationController,
      venusanimationController,
      earthanimationController,
      marsanimationController,
      jupitaranimationController,
      saturnanimationController,
      UranusanimationController,
      neptuneanimationController
    ];

    earthanimationController.repeat();
    mercuryanimationController.repeat();
    marsanimationController.repeat();
    saturnanimationController.repeat();
    neptuneanimationController.repeat();
    jupitaranimationController.repeat();
    UranusanimationController.repeat();
    venusanimationController.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
    mercuryanimationController.dispose();
    venusanimationController.dispose();
    earthanimationController.dispose();
    marsanimationController.dispose();
    jupitaranimationController.dispose();
    saturnanimationController.dispose();
    UranusanimationController.dispose();
    neptuneanimationController.dispose();
  }

  List height_witdth = [
    150.0,
    210.0,
    280.0,
    350.0,
    450.0,
    550.0,
    650.0,
    750.0,
  ];

  List sizeh_w = [
    25.0,
    40.0,
    50.0,
    30.0,
    60.0,
    60.0,
    60.0,
    60.0,
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<PlanetProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: const Text(
              "List Of Planet",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_sharp,
                color: Colors.white,
                size: 20,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("bookmark_screen");
                  Provider.of<SharePrefProvider>(context, listen: false)
                      .retrievePlanet(key: provider.key);
                  Provider.of<SharePrefProvider>(context, listen: false)
                      .StroredPlanetsList
                      .add(
                          Provider.of<SharePrefProvider>(context, listen: false)
                              .storedPlanet);
                },
                icon: const Icon(
                  Icons.bookmark,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: provider.AllPlanets.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                leading: AnimatedBuilder(
                  animation: animationController,
                  builder: (context, value) {
                    return Transform.rotate(
                      angle: angle.value,
                      child: Container(
                        height: sizeh_w[index],
                        width: sizeh_w[index],
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image:
                                NetworkImage(provider.AllPlanets[index].image),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                title: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    "${provider.AllPlanets[index].name}",
                    style: const TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("Detail", arguments: index);
                    Provider.of<SharePrefProvider>(context, listen: false)
                        .savePlanet(
                            key: provider.key,
                            planets: provider.AllPlanets[index].name);
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.deepPurple,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
