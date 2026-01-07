import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:poster/functions.dart';
import 'package:poster/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

final _formKey = GlobalKey<FormState>();
late String email;
late String password;
late String username;
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController usernameController = TextEditingController();

class _SignupPageState extends State<SignupPage> {
  void onSignUP() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        email = emailController.text;
        password = passwordController.text;
        username = usernameController.text;
      });
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      createUser(email, password, username);

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    email = "";
    password = "";
    username = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Poster",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "Sign up",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Something@email.com",

                          label: Text("Email"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        controller: emailController,
                        validator: (value) {
                          if (!value!.contains("@") || !value.contains(".")) {
                            return "Invalid Email";
                          } else if (value.isEmpty) {
                            return "Can,t be null";
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "@username",

                          label: Text("Username"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        controller: usernameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Can,t be null";
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "******",

                          label: Text("Password"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Can,t be null";
                          }
                          return null;
                        },
                        obscureText: true,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        onSignUP();
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.black),
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginPage();
                            },
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text("Already have an account? Login here"),
                      ),
                    ),
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
