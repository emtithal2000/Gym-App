import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class FindUS extends StatelessWidget {
  const FindUS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('Find Us'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () async {await launchUrl(
              Uri.parse('https://wa.me/+96871766402'),
            );
              },
            child: SizedBox(
              height: 250,
              width: 250,
              child: Lottie.asset('assets/whatsappp-icon.json'),
            ),
          ),
          const Text(
            'You can find us on WhatsUp',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 3,
            height: 50,
          ),
          InkWell(
            onTap: () async {
              await launchUrl(
                Uri.parse('https://www.instagram.com/horizonfitness/?hl=en'),
              );
            },
            child: SizedBox(
              width: 250,
              child: Lottie.asset('assets/instagram-logo.json'),
            ),
          ),
          const Text(
            'You can find us on Instagram',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
