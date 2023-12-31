import 'dart:math';

import 'package:flutter/material.dart';
import 'package:galaxy_app/provider/planet_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController opacityController;
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
  List height_witdth = [
    120,
    180,
    250,
    350,
    450,
    550,
    650,
    750,
  ];
  List size = [
    25,
    40,
    50,
    30,
    60,
    60,
    50,
    60,
  ];
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 15), () {
      Navigator.of(context).pushNamed("/");
    });
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 120,
      ),
    )..forward();
    opacityController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 5,
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
        parent: opacityController,
        curve: Curves.bounceIn,
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
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<PlanetProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: AnimatedBuilder(
                animation: opacityController,
                builder: (context, val) {
                  return Opacity(
                    opacity: opacity.value,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: size.height,
                              width: size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: AssetImage("assets/image/galaxy.jpg"),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: TweenAnimationBuilder(
                                tween: Tween(begin: 0.0, end: pi * 2),
                                duration: Duration(seconds: 30),
                                builder: (context, val, _) {
                                  return Transform.rotate(
                                    angle: val,
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      margin: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/image/sun.png"),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Center(
                              child: RotationTransition(
                                turns: Tween<double>(
                                        begin: 0.0, end: (pi * 2).toDouble())
                                    .animate(mercuryanimationController),
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment(0, -1.4),
                                  child: TweenAnimationBuilder(
                                    tween: Tween(begin: 0.0, end: pi * 3),
                                    duration: Duration(seconds: 30),
                                    builder: (context, val, _) {
                                      return Transform.rotate(
                                        angle: val,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              print("-----Start----");
                                              Navigator.of(context).pushNamed(
                                                  'Detail',
                                                  arguments: 0);
                                              print("-----end----");
                                            });
                                          },
                                          child: Container(
                                            height: 25,
                                            width: 25,
                                            margin: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                    "assets/image/mercury.png"),
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
                            Center(
                              child: RotationTransition(
                                turns: Tween<double>(
                                        begin: 0.0, end: (pi * 2).toDouble())
                                    .animate(venusanimationController),
                                child: Container(
                                  height: 180,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment(0, -1.4),
                                  child: TweenAnimationBuilder(
                                    tween: Tween(begin: 0.0, end: pi * 3),
                                    duration: Duration(seconds: 30),
                                    builder: (context, val, _) {
                                      return Transform.rotate(
                                        angle: val,
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          margin: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/image/venus.png"),
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
                            Center(
                              child: RotationTransition(
                                turns: Tween<double>(
                                        begin: 0.0, end: (pi * 2).toDouble())
                                    .animate(earthanimationController),
                                child: Container(
                                  height: 250,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment(0, -1.4),
                                  child: TweenAnimationBuilder(
                                    tween: Tween(begin: 0.0, end: pi * 3),
                                    duration: Duration(seconds: 30),
                                    builder: (context, val, _) {
                                      return Transform.rotate(
                                        angle: val,
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          margin: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/image/earth.png"),
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
                            Center(
                              child: RotationTransition(
                                turns: Tween<double>(
                                        begin: 0.0, end: (pi * 2).toDouble())
                                    .animate(marsanimationController),
                                child: Container(
                                  height: 350,
                                  width: 350,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment(0, -1.2),
                                  child: TweenAnimationBuilder(
                                    tween: Tween(begin: 0.0, end: pi * 2),
                                    duration: Duration(seconds: 30),
                                    builder: (context, val, _) {
                                      return Transform.rotate(
                                        angle: val,
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          margin: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/image/mars.png"),
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
                            Center(
                              child: RotationTransition(
                                turns: Tween<double>(
                                        begin: 0.0, end: (pi * 2).toDouble())
                                    .animate(jupitaranimationController),
                                child: Container(
                                  height: 450,
                                  width: 450,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment(0, -1.2),
                                  child: TweenAnimationBuilder(
                                    tween: Tween(begin: 0.0, end: pi * 2),
                                    duration: Duration(seconds: 30),
                                    builder: (context, val, _) {
                                      return Transform.rotate(
                                        angle: val,
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          margin: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/image/jupitar.png"),
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
                            Center(
                              child: RotationTransition(
                                turns: Tween<double>(
                                        begin: 0.0, end: (pi * 2).toDouble())
                                    .animate(saturnanimationController),
                                child: Container(
                                  height: 550,
                                  width: 550,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment(0, -1.2),
                                  child: TweenAnimationBuilder(
                                    tween: Tween(begin: 0.0, end: pi * 2),
                                    duration: Duration(seconds: 30),
                                    builder: (context, val, _) {
                                      return Transform.rotate(
                                        angle: val,
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          margin: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/image/saturn.png"),
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
                            Center(
                              child: RotationTransition(
                                turns: Tween<double>(
                                        begin: 0.0, end: (pi * 2).toDouble())
                                    .animate(UranusanimationController),
                                child: Container(
                                  height: 650,
                                  width: 650,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment(0, -1.2),
                                  child: TweenAnimationBuilder(
                                    tween: Tween(begin: 0.0, end: pi * 2),
                                    duration: Duration(seconds: 30),
                                    builder: (context, val, _) {
                                      return Transform.rotate(
                                        angle: val,
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          margin: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/image/uranus.png"),
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
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
