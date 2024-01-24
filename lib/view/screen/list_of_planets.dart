import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/planet_provider.dart';

class PlanetListPage extends StatefulWidget {
  const PlanetListPage({Key? key}) : super(key: key);

  @override
  State<PlanetListPage> createState() => _PlanetListPageState();
}

class _PlanetListPageState extends State<PlanetListPage>
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
        curve: Interval(
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<PlanetProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: Colors.deepPurple,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("Info_List_of_page");
                },
                icon: Icon(
                  Icons.list,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
            title: Text(
              "Galaxy App",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 1200,
                        width: size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: AssetImage("assets/image/galaxy.jpg"),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              Navigator.of(context)
                                  .pushNamed("Detail", arguments: 3);
                            },
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: AnimatedBuilder(
                            animation: animationController,
                            builder: (context, value) {
                              return Transform.rotate(
                                angle: angle.value,
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: const DecorationImage(
                                      image: AssetImage("assets/image/sun.png"),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      ...List.generate(
                        provider.AllPlanets.length,
                        (index) => Center(
                          child: RotationTransition(
                            turns: Tween<double>(
                                    begin: 0.0, end: (pi * 2).toDouble())
                                .animate(
                              planetControllers[index],
                            ),
                            child: Container(
                              height: height_witdth[index],
                              width: height_witdth[index],
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment(0, -1.4),
                              child: AnimatedBuilder(
                                animation: animationController,
                                builder: (context, value) {
                                  return Transform.rotate(
                                    angle: angle.value,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(
                                          () {
                                            Navigator.of(context).pushNamed(
                                              "Detail",
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        height: sizeh_w[index],
                                        width: sizeh_w[index],
                                        margin: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: NetworkImage(provider
                                                .AllPlanets[index].image),
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
