import 'dart:io';
import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddSubscription extends StatefulWidget {
  const AddSubscription({super.key});

  @override
  State<AddSubscription> createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<AddSubscription> {
  final _formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var weight = TextEditingController();
  var price = TextEditingController();
  var materials = TextEditingController();

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
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
                          // _pickImage();
                        },
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
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
                            Icons.upload,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                TextFormField(
                  controller: name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Item Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .025,
                ),
                TextFormField(
                  controller: weight,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Item Weight',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .025,
                ),
                TextFormField(
                  controller: price,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Item Price',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .025,
                ),
                TextFormField(
                  controller: materials,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Item Materials',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .075,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .075,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (_image != null) {
                            final database = FirebaseDatabase.instance
                                .ref()
                                .child('/Products');
                            database.push().set({
                              'Item Image': _image!.path,
                              'Item Name': name.text,
                              'Item Weight': weight.text,
                              'Item Price': price.text,
                              'Item Materials': materials.text,
                            });
                          }
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
