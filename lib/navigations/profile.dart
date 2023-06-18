import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:first_app/models/user_model.dart';
import 'package:first_app/services/fetch_data.dart';
import 'package:first_app/services/values.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isActive = false;
  final userName = TextEditingController();
  final email = TextEditingController();
  final mobilePhone = TextEditingController();

  File? _image;
  Future _pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    File? img = File(image.path);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer<FetchData>(
        builder: (context, data, _) {
          data.fetchData(data.user?.id ?? '');
          return SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text(
                              'Select Image Path',
                              textAlign: TextAlign.center,
                            ),
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    _pickImage(ImageSource.camera);
                                  },
                                  child: const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Camera',
                                      ),
                                      Icon(
                                        Icons.camera_alt_outlined,
                                      ),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _pickImage(ImageSource.gallery);
                                  },
                                  child: const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Gallery',
                                      ),
                                      Icon(
                                        Icons.photo_library_outlined,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 65,
                        backgroundImage: FileImage(
                          File(data.user?.imagePath ?? ''),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      data.user!.activeSub ?? '',
                      style: TextStyle(
                        color: data.user?.activeSub != ''
                            ? Colors.greenAccent
                            : Colors.redAccent,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 30,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const Text(
                              'Username:',
                              textScaleFactor: 1.7,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.person_rounded,
                                  color: Colors.blue,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                isActive
                                    ? SizedBox(
                                        height: 50,
                                        width: 150,
                                        child: TextField(
                                          controller: userName,
                                          decoration: InputDecoration(
                                            hintText: data.user?.userName ?? '',
                                            border: const OutlineInputBorder(),
                                          ),
                                        ),
                                      )
                                    : Text(
                                        data.user?.userName ?? '',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Text(
                              'Mobile Phone:',
                              textScaleFactor: 1.7,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.phone_rounded,
                                  color: Colors.blue,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                isActive
                                    ? SizedBox(
                                        height: 50,
                                        width: 150,
                                        child: TextField(
                                          controller: mobilePhone,
                                          decoration: InputDecoration(
                                            hintText:
                                                data.user?.mobilePhone ?? '',
                                            border: const OutlineInputBorder(),
                                          ),
                                        ),
                                      )
                                    : Text(
                                        data.user?.mobilePhone ?? '',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Text(
                              'Email:',
                              textScaleFactor: 1.7,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.email_rounded,
                                  color: Colors.blue,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                isActive
                                    ? SizedBox(
                                        height: 50,
                                        width: 150,
                                        child: TextField(
                                          controller: email,
                                          decoration: InputDecoration(
                                            hintText: data.user?.email ?? '',
                                            border: const OutlineInputBorder(),
                                          ),
                                        ),
                                      )
                                    : Text(
                                        data.user?.email ?? '',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            ElevatedButton(
                              onPressed: isActive
                                  ? () {
                                      final user = UserModel(
                                        id: data.user?.id,
                                        userName: userName.text.isNotEmpty
                                            ? userName.text
                                            : data.user?.userName,
                                        email: email.text.isNotEmpty
                                            ? email.text
                                            : data.user?.email,
                                        mobilePhone: mobilePhone.text.isNotEmpty
                                            ? mobilePhone.text
                                            : data.user?.mobilePhone,
                                        imagePath: _image?.path.isEmpty ?? false
                                            ? data.user?.imagePath
                                            : _image?.path,
                                        password: data.user!.password,
                                        isAdmin: data.user!.email!
                                                .contains(adminEmail)
                                            ? true
                                            : false,
                                        activeSub: activeSub != ''
                                            ? activeSub
                                            : data.user?.activeSub,
                                      );
                                      final json = user.toJson();
                                      final database = FirebaseDatabase.instance
                                          .ref()
                                          .child('/Users');
                                      database
                                          .child(data.user?.id ?? '')
                                          .set(json);
                                      data.fetchData(data.user?.id ?? '');
                                      setState(() {
                                        isActive = !isActive;
                                      });
                                    }
                                  : () {
                                      setState(() {
                                        isActive = !isActive;
                                      });
                                    },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Text(
                                isActive ? 'Save' : 'Edit Profile',
                              ),
                            ),
                          ],
                        ),
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
  }
}
