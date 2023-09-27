import 'package:flutter/material.dart';

import '../../Utils/Colors.dart';
import '../Login/Login.dart';
import '../Register/Register.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                  ),
                ),
                child: const Image(
                  image: AssetImage('assets/Onboard.jpg'),
                  fit: BoxFit.fitWidth,
                ),
              ),
              // Container with Text, Subtext, and Buttons
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Home Automation \n System',
                                    style: TextStyle(fontSize: 24, color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: Text(
                                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                    style: TextStyle(fontSize: 16, color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom: 24.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.7,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        backgroundColor: Colors.white,
                                        side: const BorderSide(color: Colors.white),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text('Sign In',
                                            style: TextStyle(fontSize: 18, color: Colors.black)),
                                      ),
                                      onPressed: () {
                                        debugPrint('Login');
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => const Login()));
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.7,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        backgroundColor: Colors.transparent,
                                        side: const BorderSide(color: Colors.white),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text('Register',
                                            style: TextStyle(
                                                fontSize: 18, color: Colors.white)),
                                      ),
                                      onPressed: () {
                                        debugPrint('Register');
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => const Register()));
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
