import 'package:flutter/material.dart';
import 'package:poster/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

final _formKey = GlobalKey<FormState>();

class _SignupPageState extends State<SignupPage> {
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
                      onPressed: () {},
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
