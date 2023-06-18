import 'package:firebase_database/firebase_database.dart';
import 'package:first_app/models/user_model.dart';
import 'package:first_app/services/fetch_data.dart';
import 'package:first_app/services/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FetchData>(
      builder: (context, data, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: const Text('Subscription'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  height: 125,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * .02,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white12,
                  ),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Are you sure to subscripe?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                activeSub = '${listSub[index]} Subscription';
                                final user = UserModel(
                                  id: data.user!.id,
                                  userName: data.user!.userName,
                                  email: data.user!.email,
                                  mobilePhone: data.user!.mobilePhone,
                                  imagePath: data.user!.imagePath,
                                  password: data.user!.password,
                                  isAdmin:
                                      data.user!.email!.contains(adminEmail)
                                          ? true
                                          : false,
                                  activeSub: activeSub != ''
                                      ? activeSub
                                      : 'No Subscription Activated!',
                                );
                                final json = user.toJson();
                                final database = FirebaseDatabase.instance
                                    .ref()
                                    .child('/Users');
                                database.child(data.user?.id ?? '').set(json);
                                data.fetchData(data.user?.id ?? '');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    content: const Text(
                                      'Check with the workplace so that the process can be followed up',
                                    ),
                                  ),
                                );
                              },
                              child: const Text('Yes'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('No'),
                            ),
                          ],
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 125,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/sub/sub${index + 1}.jpg',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 7,
                            horizontal: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 7,
                              ),
                              Text('${listSub[index]} Subscription'),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Time: ${listTime[index]}',
                                style: const TextStyle(
                                  color: Colors.amber,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 50,
                                width: 180,
                                child: Text(
                                  'Privileges: ${listPrivileges[index]}',
                                  style: const TextStyle(
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
