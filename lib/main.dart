import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'background.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, _, __) => const HomeScreen(),
          transitionDuration: const Duration(milliseconds: 900),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const custombackground(),
          Positioned(
            right: 10,
            top: 10,
            child: SvgPicture.asset(
              'assets/Border_TR.svg',
            ),
          ),
          Positioned(
            left: 10,
            top: 10,
            child: SvgPicture.asset(
              'assets/Border_TL.svg',
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: SvgPicture.asset(
              'assets/Border_BR.svg',
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: SvgPicture.asset(
              'assets/Border_BL.svg',
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/bp_icon.png'),
                  width: 150,
                ),
                const SizedBox(
                  height: 20,
                ),
                SpinKitThreeInOut(
                  size: 40.0,
                  duration: const Duration(seconds: 1),
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven
                            ? const Color.fromARGB(255, 237, 48, 111)
                            : const Color.fromARGB(255, 48, 149, 231),
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "BUDDHIST PAINTING",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Detect and know the Celestial being",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// HomScreen section

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Hello world'),
          ],
        ),
      ),
    );
  }
}
