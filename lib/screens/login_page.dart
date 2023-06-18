import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/screens/create_account.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final email = TextEditingController();
  final password = TextEditingController();
  final resetPass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _resetForm = GlobalKey<FormState>();

  void signIn(String email, String pass) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: pass,
    );
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
              children: [
                const SizedBox(
                  height: 150,
                ),
                const Text(
                  'Log in',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 65,
                  ),
                ),
                const SizedBox(
                  height: 90,
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
                  height: 25,
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
                  height: 5,
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Form(
                        key: _resetForm,
                        child: AlertDialog(
                          title: const Text(
                            'Forget Password',
                            textAlign: TextAlign.center,
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .025,
                              ),
                              TextFormField(
                                controller: resetPass,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Some text';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Enter Email',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .025,
                              ),
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * .025,
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_resetForm.currentState!.validate()) {
                                      FirebaseAuth.instance
                                          .sendPasswordResetEmail(
                                        email: resetPass.text,
                                      );
                                    }
                                  },
                                  child: const Text(
                                    'Send',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Forget Password!',
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    signIn(email.text, password.text);
                  },
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Container(
                    height: 75,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                    child: const Center(
                      child: Text(
                        'Login',
                        textScaleFactor: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateAccount(),
                      ),
                    );
                  },
                  child: const Text(
                    'Create New Account',
                    textScaleFactor: 1.5,
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
