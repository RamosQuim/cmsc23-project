import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../providers/auth_provider.dart';
import '../providers/user_provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController collegeController = TextEditingController();
    TextEditingController courseController = TextEditingController();
    TextEditingController studentNumberController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    final form = Form(
        // form widget to have a validation capability
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                  ),
                  hintText: "Name",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your username";
                  }
                  return null;
                },
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                  ),
                  hintText: "Username",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your college";
                  }
                  return null;
                },
                controller: collegeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                  ),
                  hintText: "College",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your course";
                  }
                  return null;
                },
                controller: courseController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                  ),
                  hintText: "Course",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your student number";
                  }
                  return null;
                },
                controller: studentNumberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                  ),
                  hintText: "Student Number",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: TextFormField(
                validator: (value) {
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value!)) {
                    return "Your input does not match into email format";
                  }
                  return null;
                },
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                  ),
                  hintText: "Email",
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value!.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Colors.greenAccent),
                    ),
                    hintText: 'Password',
                  ),
                )),
          ],
        ));

    final SignupButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            await context
                .read<AuthProvider>()
                .signUp(emailController.text, passwordController.text);

            User user = User(
                userId: 1,
                name: nameController.text,
                username: usernameController.text,
                college: collegeController.text,
                course: courseController.text,
                studentNumber: studentNumberController.text);
            context.read<UserListProvider>().addUser(user);

            if (context.mounted) Navigator.pop(context);
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.fixed,
                  content: Text('Welcome to the app, New User!')));
          }
        },
        child: const Text('Sign up', style: TextStyle(color: Colors.white)),
      ),
    );

    final backButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () async {
          Navigator.pop(context);
        },
        child: const Text('Back', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          children: <Widget>[  
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Sign Up",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
            ),
            form,
            SignupButton,
            backButton
          ],
        ),
      ),
    );
  }
}
