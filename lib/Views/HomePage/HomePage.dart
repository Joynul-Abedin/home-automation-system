import 'package:flutter/material.dart';
import 'package:home_automation_system/Models/User.dart';

class HomePage extends StatefulWidget {
  final User? user;
  const HomePage({super.key, this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Name: ${widget.user!.name}'),
          Text('Email: ${widget.user!.email}'),
          Text('Role: ${widget.user!.role?.toUpperCase()}'),
        ],
      )),
    );
  }
}
