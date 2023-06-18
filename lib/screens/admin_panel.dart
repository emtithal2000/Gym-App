import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:first_app/services/fetch_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminPanel extends StatelessWidget {
  final database = FirebaseDatabase.instance.ref();
  AdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FetchData>(
      builder: (context, data, _) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text(
              'Admin Panel',
            ),
          ),
          body: FirebaseAnimatedList(
            query: database.child('Users'),
            itemBuilder: (context, snapshot, animation, index) {
              return Container(
                height: MediaQuery.of(context).size.height * .18,
                margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * .015,
                  horizontal: MediaQuery.of(context).size.width * .025,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white12,
                ),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: FileImage(
                            File(
                              snapshot.child('Image Path').value.toString(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .03,
                        left: MediaQuery.of(context).size.width * .05,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.child('Username').value.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.amberAccent,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .015,
                          ),
                          Text(
                            snapshot.child('Email').value.toString(),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .015,
                          ),
                          Text(
                            snapshot.child('Mobile Phone').value.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.amberAccent,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .015,
                          ),
                          Text(
                            snapshot
                                .child('Active Subscription')
                                .value
                                .toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.amberAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
