import 'package:flutter/material.dart';
import 'package:minipro_app/pages/authentication/signup.dart';
import 'package:minipro_app/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minipro_app/services/firebase_service.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No User found for that email");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
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
                height: MediaQuery.of(context).size.height / 1.6,
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
                            controller: _emailController,
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
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                                hintText: 'Enter Password',
                                prefixIcon:
                                    Icon(Icons.lock, color: Colors.grey)),
                          ),
                        ),
                        // const SizedBox(height: 10),
                        // const Text(
                        //   "Forgot Password",
                        //   style: TextStyle(color: Colors.blue, fontSize: 12),
                        // ),
                        const SizedBox(height: 25),
                        Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: Colors.pink.shade400,
                          ),
                          child: TextButton(
                            onPressed: () async {
                              User? user = await loginUsingEmailPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  context: context);
                              print(user);
                              if (user != null) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              }
                            },
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "or",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        SizedBox(
                          //line
                          height: 10,
                          width: 300, // set width to the maximum available
                          child: Divider(
                            thickness: 1, // set the thickness of the line
                            color: Colors.grey, // set the color of the line
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
                                    return SignUpPage();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              "SIGNUP",
                              style: TextStyle(
                                color: Colors.black,
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
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                            border: Border.all(color: Colors.pink.shade400),
                          ),
                          child: TextButton(
                            onPressed: () async{
                              await FirebaseServices().signInWithGoogle();
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) => HomePage()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("asset/google.jpg"),
                                SizedBox(width: 20),
                                Text(
                                  "Continue with Google",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ],
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
