import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Exercise extends StatelessWidget {
  const Exercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                    builder: (context) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(50),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset('assets/training/bench_press.json'),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .025,
                            ),
                            const Text(
                              'Bench Press',
                              textScaleFactor: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              '10 Times',
                              textScaleFactor: 2,
                            ),
                            const Text(
                              '60 Second',
                              textScaleFactor: 2,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .2,
                      width: MediaQuery.of(context).size.width * .4,
                      color: Colors.white12,
                      child: Lottie.asset('assets/training/bench_press.json'),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .015,
                    ),
                    const Text(
                      'Bench Press',
                      textScaleFactor: 1.5,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                    builder: (context) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(50),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .35,
                              child: Lottie.asset(
                                  'assets/training/rope_exercise.json'),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .025,
                            ),
                            const Text(
                              'Jump Exercise',
                              textScaleFactor: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              '15 Times',
                              textScaleFactor: 2,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              '60 Second',
                              textScaleFactor: 2,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .2,
                      width: MediaQuery.of(context).size.width * .4,
                      color: Colors.white12,
                      child: Lottie.asset('assets/training/rope_exercise.json'),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .015,
                    ),
                    const Text(
                      'Jump Exercise',
                      textScaleFactor: 1.5,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                    builder: (context) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(50),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .35,
                              child:
                                  Lottie.asset('assets/training/push_up.json'),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .025,
                            ),
                            const Text(
                              'Push Up',
                              textScaleFactor: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              '10 Times',
                              textScaleFactor: 2,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              '60 Second',
                              textScaleFactor: 2,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .2,
                      width: MediaQuery.of(context).size.width * .4,
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Lottie.asset('assets/training/push_up.json'),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .015,
                    ),
                    const Text(
                      'Push Up',
                      textScaleFactor: 1.5,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                    builder: (context) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(50),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .35,
                              child: Lottie.asset(
                                  'assets/training/home_treadmill.json'),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .025,
                            ),
                            const Text(
                              'Home Run',
                              textScaleFactor: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .015,
                            ),
                            const Text(
                              '5 Minutes',
                              textScaleFactor: 2,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .2,
                      width: MediaQuery.of(context).size.width * .4,
                      color: Colors.white12,
                      child: Lottie.asset(
                        'assets/training/home_treadmill.json',
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .015,
                    ),
                    const Text(
                      'Home Run',
                      textScaleFactor: 1.5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
