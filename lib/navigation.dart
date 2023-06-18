import 'dart:io';

import 'package:first_app/screens/admin_panel.dart';
import 'package:first_app/screens/cart.dart';
import 'package:first_app/screens/create_account.dart';
import 'package:first_app/services/fetch_data.dart';
import 'package:first_app/services/handle_sign.dart';
import 'package:first_app/services/list_page.dart';
import 'package:first_app/services/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/add_item.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Consumer<FetchData>(
      builder: (context, data, _) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text('Horizon Fitness'),
            actions: [
              data.user?.isAdmin ?? false
                  ? IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddSubscription(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.add,
                      ),
                    )
                  : Container(),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 260,
                  child: UserAccountsDrawerHeader(
                    accountName: Text(data.user?.userName ?? ''),
                    accountEmail: Text(data.user?.email ?? ''),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: FileImage(
                        File(data.user?.imagePath ?? ''),
                      ),
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      image: DecorationImage(
                        image: AssetImage('assets/popo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.share),
                  title: const Text('Share'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: const Text('Cart'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Cart(),
                      ),
                    );
                  },
                ),
                data.user?.isAdmin ?? false
                    ? ListTile(
                        leading: const Icon(
                          Icons.admin_panel_settings_outlined,
                        ),
                        title: const Text('Admin Panel'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdminPanel(),
                            ),
                          );
                        },
                      )
                    : Container(),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Sign Out'),
                  onTap: () {
                    signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingHome(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 200,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Horizon Fitness GYM',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * .055,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.call,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '+968 71985230',
                          textScaleFactor: 1.35,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Buy',
                icon: Icon(
                  Icons.shopping_cart,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  Icons.home_rounded,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Exercise',
                icon: Icon(
                  Icons.accessibility_new_rounded,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(
                  Icons.person_2_rounded,
                ),
              ),
            ],
          ),
          body: pages[index],
        );
      },
    );
  }
}
