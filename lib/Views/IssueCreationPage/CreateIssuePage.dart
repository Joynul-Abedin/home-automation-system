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

class CreateIssuePage extends StatefulWidget {
  const CreateIssuePage({super.key});

  @override
  State<CreateIssuePage> createState() => _CreateIssuePageState();
}

class _CreateIssuePageState extends State<CreateIssuePage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool obscured = true;

  Future<bool> saveIssue(String email, String password) async {
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
                          padding: EdgeInsets.only(
                              top: 40.0, left: 8.0, right: 8.0, bottom: 24),
                          child: Text('Login to Your Account',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Your Email',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              TextFormField(
                                controller: _email,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.textFieldColor,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 4.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide:
                                    const BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              TextFormField(
                                obscureText: obscured,
                                obscuringCharacter: '*',
                                controller: _password,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.textFieldColor,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 8.0),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      obscured
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        obscured = !obscured;
                                      });
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide:
                                    const BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 4.0),
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(
                                    color: Color.fromRGBO(120, 107, 203, 1)),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 24.0),
                        GestureDetector(
                          onTap: () {
                            // saveIssue(_email.text, _password.text);
                          },
                          child: Container(
                            height: 50,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primaryColor,
                            ),
                            child: const Center(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
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
