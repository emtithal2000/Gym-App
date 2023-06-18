import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/navigation.dart';
import 'package:first_app/screens/login_page.dart';
import 'package:flutter/material.dart';

class SettingHome extends StatelessWidget {
  const SettingHome({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return const Navigation();
        } else {
          return Login();
        }
      },
    );
  }
}
