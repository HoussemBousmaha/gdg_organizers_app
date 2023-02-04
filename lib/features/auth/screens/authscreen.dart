import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gdg_organizers_app/constants/const.dart';
import 'dart:math' as math;

import '../widgets/authwidgets.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          fit: StackFit.expand,
          children: [
            const Align(
              alignment: Alignment.bottomLeft,
              child: AuthAnimation(
                repeat: false,
                begin: Offset(0, 2),
                duration: Duration(
                  seconds: 1,
                  milliseconds: 500,
                ),
                end: Offset(0, 0.0),
                curve: Curves.bounceIn,
                child: SVG(
                  image: 'WTM.svg',
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: AuthAnimation(
                repeat: false,
                begin: Offset(0, 2),
                duration: Duration(
                  seconds: 2,
                ),
                end: Offset(0.09, 0.0),
                curve: Curves.bounceIn,
                child: SVG(
                  image: 'Vector 18.svg',
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: AuthAnimation(
                repeat: false,
                begin: Offset(0, -2),
                duration: Duration(seconds: 2, milliseconds: 700),
                end: Offset(-0.09, 0.0),
                curve: Curves.bounceIn,
                child: SVG(
                  image: 'MAKAM.svg',
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topRight,
              child: AuthAnimation(
                repeat: false,
                begin: Offset(0, -2),
                duration: Duration(
                  seconds: 4,
                ),
                end: Offset(0, 0.0),
                curve: Curves.bounceInOut,
                child: SVG(
                  image: 'GDG.svg',
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome',
                      style:
                          TextStyle(fontSize: 57, fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Email',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400)),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: emaillinearGradient),
                            child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  hintText: 'Enter your email',
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  errorBorder: InputBorder.none),
                            ),
                          ),
                          const Text('Password',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400)),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: passwordlinearGradient),
                            child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  hintText: 'Enter your password',
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  errorBorder: InputBorder.none),
                            ),
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: const Text('Forgot Password?',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: kTextLightColor,
                                    )),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          ElevatedButton(
                            style: Theme.of(context)
                                .elevatedButtonTheme
                                .style!
                                .copyWith(
                                  minimumSize: MaterialStateProperty.all(
                                    const Size(double.infinity, 45),
                                  ),
                                ),
                            onPressed: () {},
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    const AuthAnimation(
                      repeat: false,
                      begin: Offset(-2, 0),
                      duration: Duration(
                        seconds: 4,
                      ),
                      end: Offset(0, 0.0),
                      curve: Curves.bounceIn,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                        child: Authpic(),
                      ),
                    ),
                    const CustomLoader(),
                    // CircularProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

