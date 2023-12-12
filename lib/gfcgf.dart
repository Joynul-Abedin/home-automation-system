import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:home_automation_system/Models/User.dart';
import 'package:home_automation_system/Utils/Colors.dart';
import 'package:home_automation_system/Views/HomePage/HomePage.dart';
import 'package:home_automation_system/Views/IssueTraking/IssueTrakerPage.dart';
import 'package:home_automation_system/Views/Register/Register.dart';
import 'package:http/http.dart' as http;

import '../../Utils/Constants.dart';
import '../../Utils/Functions.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool obscured = true;

  Future<bool> login(String email, String password) async {
    final Map<String, String> requestData = {
      "email": email,
      "password": password,
    };

    final response = await http.post(
      Uri.parse('${Constants.baseUrl}/login'),
      body: json.encode(requestData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      debugPrint(data.toString());
      final user = User.fromJson(data['user']);
      debugPrint(user.toString());
      FunctionsUtility.showToastMessage(
          'Login Successful', Colors.green);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const IssueTrackerScreen()));
      return true;
    } else {
      final errorData = json.decode(response.body);
      final errorMessage = errorData['message'] ?? 'Unknown error occurred';
      FunctionsUtility.showToastMessage(errorMessage, Colors.red);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryColor,
                  AppColors.primaryColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            )),
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryColor, AppColors.primaryColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: const Image(
                image: AssetImage('assets/Onboard-Without-BG.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60),
                    topLeft: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Explore Today\'s Issues',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.blue,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return IssueItem();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
