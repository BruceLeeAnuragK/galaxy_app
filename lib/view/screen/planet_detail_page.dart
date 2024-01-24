import 'dart:math';

import 'package:flutter/material.dart';
import 'package:galaxy_app/provider/planet_provider.dart';
import 'package:provider/provider.dart';

class PlanetDetailPage extends StatefulWidget {
  const PlanetDetailPage({Key? key}) : super(key: key);

  @override
  State<PlanetDetailPage> createState() => _PlanetDetailPageState();
}

class _PlanetDetailPageState extends State<PlanetDetailPage>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController positionanimationController;
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
  late Animation bannerposition;
  late Animation opacity;
  late List<AnimationController> planetControllers;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 10,
      ),
    )..forward();
    positionanimationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 10,
      ),
    )..forward();
    mercuryanimationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 40,
      ),
    )..forward();
    venusanimationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 60,
      ),
    )..forward();
    earthanimationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 80,
      ),
    )..forward();
    marsanimationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 100,
      ),
    )..forward();

    jupitaranimationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 120,
      ),
    )..forward();
    saturnanimationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 140,
      ),
    )..forward();
    UranusanimationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 160,
      ),
    )..forward();

    neptuneanimationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 180,
      ),
    )..forward();

    angle = Tween<double>(
      begin: 0.0,
      end: (pi * 2).toDouble(),
    ).animate(
      animationController,
    );
    animationController.forward();
    positionanimationController.forward();
    opacity = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: positionanimationController,
        curve: Interval(
          0.5,
          1.0,
        ),
      ),
    );
    bannerposition = Tween(
      begin: -150.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: positionanimationController,
        curve: Interval(
          0.0,
          0.5,
        ),
      ),
    );
    position = Tween(
      begin: 500.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.5),
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
    positionanimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    int indexData = ModalRoute.of(context)!.settings.arguments as int;
    return Consumer<PlanetProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Planet Details",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.deepPurple,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                AnimatedBuilder(
                  animation: planetControllers[indexData],
                  builder: (context, child) {
                    return Container(
                      height: 300,
                      child: Stack(
                        children: [
                          ListView(
                            children: [
                              Transform.translate(
                                offset: Offset(0, bannerposition.value),
                                child: Container(
                                  width: double.infinity,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Transform.translate(
                            offset: Offset(0, position.value),
                            child: Opacity(
                              opacity: opacity.value,
                              child: Column(
                                children: [
                                  AnimatedBuilder(
                                    animation: animationController,
                                    builder: (context, value) {
                                      return Transform.rotate(
                                        angle: angle.value,
                                        child: Container(
                                          height: 200,
                                          width: 200,
                                          margin: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage(provider
                                                  .AllPlanets[indexData].image),
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return Container(
                      height: 300,
                      child: Stack(
                        children: [
                          ListView(
                            children: [
                              Transform.translate(
                                offset: Offset(0, position.value),
                                child: Container(
                                  width: double.infinity,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        offset: Offset(3, 3),
                                        spreadRadius: 10,
                                        color: Colors.deepPurple,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Transform.translate(
                            offset: Offset(0, position.value),
                            child: Opacity(
                              opacity: opacity.value,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        "${provider.AllPlanets[indexData].name}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        "${provider.AllPlanets[indexData].description}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
