import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week9_authentication/screens/user_details.dart';
import '../models/todo_model.dart';
import '../providers/todo_provider.dart';
import '../providers/auth_provider.dart';
import '../screens/modal_todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/login.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    // access the list of todos in the provider
    Stream<User?> userStream = context.watch<AuthProvider>().uStream;

    return StreamBuilder(
        stream: userStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error encountered! ${snapshot.error}"),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData) {
            return const LoginPage();
          }

          // if user is logged in, display the scaffold containing the streambuilder for the todos
          return displayScaffold(context);
        });
  }

  Scaffold displayScaffold(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
        ListTile(
          title: const Text('Details'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserDetailsPage()));
          },
        ),
        ListTile(
          title: const Text('Logout'),
          onTap: () {
            context.read<AuthProvider>().signOut();
            Navigator.pop(context);
          },
        ),
      ])),
      appBar: AppBar(
        title: Text("Todo"),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          children: const <Widget>[
            Text(
              "WELCOME TO HOMEPAGE",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => const AlertDialog(
                    title: Text("This is for adding health status entry"),
                  ));
        },
        child: const Icon(Icons.add_outlined),
      ),
    );
  }
}
