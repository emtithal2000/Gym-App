import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:first_app/models/items_model.dart';
import 'package:first_app/services/fetch_data.dart';
import 'package:first_app/services/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Buy extends StatelessWidget {
  final database = FirebaseDatabase.instance.ref();
  Buy({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FetchData>(
      builder: (context, data, _) {
        return Scaffold(
          body: FirebaseAnimatedList(
            query: database.child('Products'),
            duration: const Duration(seconds: 3),
            itemBuilder: (context, snapshot, animation, index) {
              return SlideTransition(
                position: Tween(
                  begin: const Offset(1, 0),
                  end: const Offset(0, 0),
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.bounceOut,
                  ),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * .19,
                  margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * .015,
                    horizontal: MediaQuery.of(context).size.width * .025,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white12,
                  ),
                  child: InkWell(
                    onTap: () {
                      list.add(
                        ItemModel(
                          itemImage:
                              snapshot.child('Item Image').value.toString(),
                          itemName:
                              snapshot.child('Item Name').value.toString(),
                          itemPrice: double.tryParse(
                              snapshot.child('Item Price').value.toString()),
                          itemWeight:
                              snapshot.child('Item Weight').value.toString(),
                          itemMaterials:
                              snapshot.child('Item Materials').value.toString(),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .38,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: FileImage(
                                File(
                                  snapshot.child('Item Image').value.toString(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * .015,
                            left: MediaQuery.of(context).size.width * .05,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.child('Item Name').value.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amberAccent,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              ),
                              Text(
                                'Item Weights: ${snapshot.child('Item Weight').value.toString()}',
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              ),
                              Text(
                                snapshot
                                    .child('Item Materials')
                                    .value
                                    .toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amberAccent,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              ),
                              Text(
                                'Price: ${snapshot.child('Item Price').value.toString()}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amberAccent,
                                ),
                              ),
                              data.user?.isAdmin ?? false
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                .25,
                                      ),
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              database
                                                  .child('Products')
                                                  .child(snapshot.key!)
                                                  .remove();
                                            },
                                            icon: const Icon(
                                              Icons.delete_forever_outlined,
                                              color: Colors.red,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.edit,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
