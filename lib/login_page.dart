import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final _formKey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Poster")),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(backgroundColor: Colors.black, radius: 100),
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
                    ElevatedButton(onPressed: () {}, child: Text("Login")),
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
