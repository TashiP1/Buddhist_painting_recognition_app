import 'package:buddhist_painting_recognition_app/Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'background.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          pageBuilder: (context, _, __) => const onboard(),
          transitionDuration: const Duration(milliseconds: 2300),
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
                  width: 170,
                ),
                const SizedBox(
                  height: 20,
                ),
                SpinKitFadingCircle(
                  size: 70.0,
                  duration: const Duration(seconds: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven
                            ? const Color.fromARGB(255, 235, 228, 230)
                            : const Color.fromARGB(255, 48, 149, 231),
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// onbording page section

class onboard extends StatefulWidget {
  const onboard({super.key});

  @override
  State<onboard> createState() => _onboardState();
}

class _onboardState extends State<onboard> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      showNextButton: true,
      done: const Text(
        "Done",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 223, 98, 40),
            fontSize: 16),
      ),
      pages: [
        PageViewModel(
          title: '',
          bodyWidget: Column(
            children: const [
              Text(
                  'Aimed at promoting the rich cultural heritage of Bhutan and its revered religious figures.',
                  style: TextStyle(fontFamily: 'Dosis', fontSize: 16),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 20,
              ),
              Text(
                  'Hope to gain a deeper appreciation for Bhutans cultural identity and encourage further exploration of this fascinating corner of the world.',
                  style: TextStyle(fontFamily: 'Dosis', fontSize: 16),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 70,
              ),
              Image(
                image: AssetImage('assets/border.png'),
                width: 250,
              ),
            ],
          ),
          image: buildImage('assets/onboard1.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: '',
          bodyWidget: Column(
            children: const [
              Text(
                  'Our application uses advanced computer vision algorithms to live detect celestial beings in Buddhist paintings.',
                  style: TextStyle(fontFamily: 'Dosis', fontSize: 16),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 20,
              ),
              Text(
                  'It provides users with detailed information on the being, including their name, significance, and other relevant details.',
                  style: TextStyle(fontFamily: 'Dosis', fontSize: 16),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 50,
              ),
              Image(
                image: AssetImage('assets/border.png'),
                width: 250,
              ),
            ],
          ),
          image: buildImage('assets/onboard2.png'),
          decoration: getPageDecoration(),
        ),
      ],
      onDone: () => goToHome(context),
      showSkipButton: true,
      skip: const Text(
        'Skip',
        style: TextStyle(color: Color.fromARGB(255, 223, 98, 40), fontSize: 16),
      ),
      onSkip: () => goToHome(context),
      next: const Icon(
        Icons.arrow_forward,
        color: Color.fromARGB(255, 223, 98, 40),
      ),
      dotsDecorator: getDotDecoration(),
    );
  }

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );

  Widget buildImage(String path) => Container(
        margin: const EdgeInsets.only(top: 100),
        child: Image.asset(path, width: 400),
      );

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: const Color.fromARGB(255, 181, 153, 140),
        size: const Size(10, 10),
        activeColor: const Color.fromARGB(255, 223, 98, 40),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        bodyPadding: EdgeInsets.only(left: 20, right: 20),
      );
}
