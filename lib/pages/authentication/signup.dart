import 'package:flutter/material.dart';
import 'package:minipro_app/components/showSnackbar.dart';
import 'package:minipro_app/pages/authentication/login.dart';
import 'package:minipro_app/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.3,
                  decoration: BoxDecoration(
                    color: Colors.pink.shade200,
                  ),
                  child: Center(
                    child: Image.asset("asset/logoo.jpg", height: 160),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.6,
                decoration: BoxDecoration(
                  color: Colors.pink.shade200,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                padding: EdgeInsets.only(top: 40, bottom: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(70)),
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 50,
                          width: 300,
                          color: Colors.white,
                          child: TextField(
                            controller: usernameController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Username',
                                hintText: 'Enter Username',
                                prefixIcon:
                                    Icon(Icons.person, color: Colors.grey)),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          height: 50,
                          width: 300,
                          color: Colors.white,
                          child: TextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                                hintText: 'Enter Email',
                                prefixIcon:
                                    Icon(Icons.mail, color: Colors.grey)),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          height: 50,
                          width: 300,
                          color: Colors.white,
                          child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                                hintText: 'Enter Password',
                                prefixIcon:
                                    Icon(Icons.lock, color: Colors.grey)),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          height: 50,
                          width: 300,
                          color: Colors.white,
                          child: TextField(
                            controller: confirmController,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Confirm Password',
                                hintText: 'Enter Password',
                                prefixIcon:
                                    Icon(Icons.lock, color: Colors.grey)),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: Colors.pink.shade400,
                          ),
                          child: TextButton(
                            onPressed: () async {
                              try {
                                String fullName =
                                    usernameController.text.trim();
                                String email = emailController.text.trim();
                                String password =
                                    passwordController.text.trim();
                                String confirmPassword =
                                    confirmController.text.trim();

                                if (fullName == '') {
                                  // showSnackBar(
                                  //     context, "Please, Enter your full name!");
                                  throw ('Full name is null');
                                }

                                if (password != confirmPassword) {
                                  // showSnackBar(context,
                                  //     "Password and Confirm-password is not match.");
                                  throw ("Password and Confirm-password is not match.");
                                }

                                await _auth
                                    .createUserWithEmailAndPassword(
                                        email: email, password: password)
                                    .then((authResult) async {
                                  User? user = authResult.user;

                                  if (user == null) {
                                    throw ('User is null');
                                  }

                                  await user.updateDisplayName(fullName);
                                  //await user?.updatePhotoURL("https://example.com/jane-q-user/profile.jpg");
                                  await user.reload();

                                  await _db
                                      .collection("users")
                                      .doc(user.uid)
                                      .set({
                                    "fullName":
                                        fullName, // Full Name I will edit later
                                    "uid": user.uid,
                                    "email": user.email,
                                    "score": 0,
                                    "photoURL": ""
                                  }).then((value) {
                                    print("Sign up user successful.");
                                    // showSnackBar(
                                    //     context, "Sign up user successful.");
                                    Navigator.pop(context);
                                  }).catchError((e) {
                                    print("Error : ${e}");
                                    // showSnackBar(context,
                                    //     "db error"); // Displaying the usual firebase error message
                                  });
                                });
                              } on FirebaseAuthException catch (e) {
                                // if you want to display your own custom error message
                                if (e.code == 'weak-password') {
                                  print('The password provided is too weak.');
                                } else if (e.code == 'email-already-in-use') {
                                  print(
                                      'The account already exists for that email.');
                                }
                                // showSnackBar(context,
                                //     e.message!); // Displaying the usual firebase error message
                              } catch (e) {
                                print("Error Something : ${e}");
                                // showSnackBar(context, "${e}");
                              }
                            },
                            child: Text(
                              "SIGNUP",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: Colors.white,
                            border: Border.all(color: Colors.pink.shade400),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return LoginPage();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              "Go Back",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
