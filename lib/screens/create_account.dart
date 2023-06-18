import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:first_app/models/user_model.dart';
import 'package:first_app/navigation.dart';
import 'package:first_app/screens/login_page.dart';
import 'package:first_app/services/values.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mobilePhone = TextEditingController();
  final TextEditingController password = TextEditingController();

  File? _image;
  Future _pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    File? img = File(image.path);
    setState(() {
      _image = img;
    });
  }

  Future<void> createUser(
    String userName,
    String email,
    String password,
    String number,
    String path,
  ) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (value) {
          final user = UserModel(
            id: value.user!.uid,
            userName: userName,
            email: email,
            mobilePhone: number,
            password: password,
            imagePath: path,
            isAdmin: email.contains(adminEmail) ? true : false,
            activeSub: 'No Subscription Activated!',
          );
          final json = user.toJson();
          final database = FirebaseDatabase.instance.ref().child('/Users');
          database.child(value.user!.uid).set(json);
        },
      );
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/popo.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipOval(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[400]!.withOpacity(0.2),
                          radius: 65,
                          backgroundImage: _image != null
                              ? FileImage(
                                  _image!,
                                )
                              : null,
                          child: _image == null
                              ? const Icon(
                                  Icons.image_outlined,
                                  size: 65,
                                )
                              : null,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 80,
                      top: 90,
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                'Select Image Path',
                                textAlign: TextAlign.center,
                              ),
                              content: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                          'Gallary',
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
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              width: 3,
                              color: Colors.white,
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_upward_rounded,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.person_outline_rounded,
                      size: 35,
                    ),
                    title: TextFormField(
                      controller: userName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Username',
                        hintStyle: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.email_outlined,
                      size: 35,
                    ),
                    title: TextFormField(
                      controller: email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Email',
                        hintStyle: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.phone,
                      size: 35,
                    ),
                    title: TextFormField(
                      controller: mobilePhone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Mobile Phone',
                        hintStyle: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.lock_outline,
                      size: 35,
                    ),
                    title: TextFormField(
                      controller: password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Some text';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Password',
                        hintStyle: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (_image != null) {
                        try {
                          createUser(
                            userName.text,
                            email.text,
                            password.text,
                            mobilePhone.text,
                            _image!.path,
                          ).whenComplete(() {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Navigation(),
                              ),
                            );
                          });
                        } catch (e) {
                          log(e.toString());
                        }
                      } else {
                        try {
                          createUser(
                            userName.text,
                            email.text,
                            password.text,
                            mobilePhone.text,
                            'assets/defualt.jpeg',
                          ).whenComplete(() {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Navigation(),
                              ),
                            );
                          });
                        } catch (e) {
                          log(e.toString());
                        }
                      }
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        'Register',
                        textScaleFactor: 1.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already Have Account?',
                      textScaleFactor: 1.2,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                      },
                      child: const Text(
                        'Login',
                        textScaleFactor: 1.2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void signOut() async {
  await FirebaseAuth.instance.signOut();
}
