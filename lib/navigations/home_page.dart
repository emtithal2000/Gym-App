import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/screens/find_us.dart';
import 'package:first_app/screens/subscription.dart';
import 'package:first_app/screens/bmi_calculator.dart';
import 'package:first_app/screens/dietary_schedules.dart';
import 'package:first_app/services/fetch_data.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer<FetchData>(
        builder: (context, data, _) {
          data.fetchData(user?.uid ?? '');
          if (data.user?.userName == '') {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Welcome ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * .09,
                          ),
                        ),
                        TextSpan(
                          text: data.user?.userName,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .06,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Subscription(),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image: AssetImage('assets/user_icon.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Text(
                          'Subscriptions',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BMI(),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image: AssetImage('assets/BMI.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Text(
                          'Calculate BMI',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DietarySchedules(),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            ),

                          child: Lottie.asset('assets/dietarySchedules.json'),
                         ),

                        const Text(
                          'Dietary Schedules',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FindUS(),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Lottie.asset('assets/qr.json'),
                        ),
                        const Text(
                          'Find Us',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
