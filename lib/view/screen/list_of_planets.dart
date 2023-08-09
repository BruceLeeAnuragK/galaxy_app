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
  late Animation<double> angle;
  late Animation position;
  late Animation opacity;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 120,
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

    angle = Tween(
      begin: 0.0,
      end: (pi * 2).toDouble(),
    ).animate(
      animationController,
    );

    opacity = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );

    position = Tween(
      begin: 500.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlanetProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("List page"),
        ),
        body: Container(
          child: ListView(
            children: List.generate(
              provider.AllPlanets.length,
              (index) => Center(
                child: RotationTransition(
                  turns: Tween<double>(begin: 0.0, end: (pi * 2).toDouble())
                      .animate(provider.planetControllers[index]
                          as AnimationController),
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    alignment: Alignment(0, -1.4),
                    child: TweenAnimationBuilder(
                      tween: Tween(begin: 0.0, end: pi * 3),
                      duration: Duration(seconds: 30),
                      builder: (context, val, _) {
                        return Transform.rotate(
                          angle: val,
                          child: Container(
                            height: 25,
                            width: 25,
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                    provider.AllPlanets[index].image),
                                fit: BoxFit.fitHeight,
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
          ),
        ),
      );
    });
  }
}
