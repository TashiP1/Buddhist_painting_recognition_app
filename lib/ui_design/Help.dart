import 'package:flutter/material.dart';
import '../Drawer/about_us.dart';

class help extends StatefulWidget {
  const help({super.key});

  @override
  State<help> createState() => _helpState();
}

class _helpState extends State<help> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(225, 232, 104, 32),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
              primary: Color.fromARGB(225, 232, 104, 32)),
        ),
        child: Stepper(
          type: StepperType.vertical,
          steps: getSteps(),
          currentStep: currentStep,
          // onStepContinue: () {
          //   final isLastStep = currentStep == getSteps().length - 1;

          //   if (isLastStep) {
          //   } else {
          //     setState(() => currentStep += 1);
          //   }
          // },
          onStepTapped: (step) => setState(() => currentStep = step),
          // onStepCancel:
          //     currentStep == 0 ? null : () => setState(() => currentStep -= 1),

          controlsBuilder: (context, ControlsDetails controlsDetails,
              {onSepContinue, onStepCancel}) {
            return Container();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                child: Image(
                  image: AssetImage("assets/nav_logo.png"),
                  height: 100,
                  fit: BoxFit.fill,
                )),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Color.fromARGB(225, 232, 104, 32),
                size: 30,
              ),
              title: const Text(' About us '),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const about(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.rate_review,
                color: Color.fromARGB(225, 232, 104, 32),
                size: 30,
              ),
              title: const Text(' Rate us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          isActive: currentStep >= 0,
          title: const Text(
            "Overview",
            style: TextStyle(fontFamily: 'Dosis', fontSize: 17),
          ),
          content: Container(
            margin: const EdgeInsets.all(5),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: const <Widget>[
                          Image(
                            image: AssetImage('helpPage/about.png'),
                            width: 50,
                          ),
                          SizedBox(height: 10),
                          Text(
                              "Information on the Developers are given in the about us page",
                              style:
                                  TextStyle(fontFamily: 'Dosis', fontSize: 16),
                              textAlign: TextAlign.justify)
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        children: const <Widget>[
                          Image(
                            image: AssetImage('helpPage/setting.png'),
                            width: 50,
                          ),
                          SizedBox(height: 10),
                          Text("Change Theme and Select Language",
                              style:
                                  TextStyle(fontFamily: 'Dosis', fontSize: 16),
                              textAlign: TextAlign.justify)
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Image(
                  image: AssetImage('helpPage/started.png'),
                  width: 150,
                ),
                const Text(
                    "Click the 'Get Started' button to start with the live detection.",
                    style: TextStyle(fontFamily: 'Dosis', fontSize: 16),
                    textAlign: TextAlign.justify)
              ],
            ),
          ),
        ),
        Step(
          isActive: currentStep >= 1,
          title: const Text("Image From Gallery",
              style: TextStyle(fontFamily: 'Dosis', fontSize: 17)),
          content: Container(
            margin: const EdgeInsets.all(5),
            child: Column(
              children: [
                Row(
                  children: const <Widget>[
                    Image(
                      image: AssetImage('helpPage/gallery.png'),
                      width: 60,
                    ),
                    SizedBox(width: 60),
                    Image(
                      image: AssetImage('helpPage/phone.png'),
                      width: 150,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                    "To detect different paintings in an image, you can access your gallery by clicking on the designated button. This will allow you to upload the image in which you want to detect the different paintings. ",
                    style: TextStyle(fontFamily: 'Dosis', fontSize: 16),
                    textAlign: TextAlign.justify)
              ],
            ),
          ),
        ),
        Step(
          isActive: currentStep >= 2,
          title: const Text("Live Detection",
              style: TextStyle(fontFamily: 'Dosis', fontSize: 17)),
          content: Container(
            margin: const EdgeInsets.all(5),
            child: Column(
              children: [
                Row(
                  children: const <Widget>[
                    Image(
                      image: AssetImage('helpPage/live.png'),
                      width: 60,
                    ),
                    SizedBox(width: 60),
                    Image(
                      image: AssetImage('helpPage/yolo.png'),
                      width: 150,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                    "To access your camera, simply press the button and point it towards the direction of the Buddhist paintings. The camera will then detect the image and display the name of the painting. When clicked on the detected image, it will show the details",
                    style: TextStyle(fontFamily: 'Dosis', fontSize: 16),
                    textAlign: TextAlign.justify)
              ],
            ),
          ),
        ),
        Step(
          isActive: currentStep >= 3,
          title: const Text("Display Prediction",
              style: TextStyle(fontFamily: 'Dosis', fontSize: 17)),
          content: Container(
            margin: const EdgeInsets.all(5),
            child: Column(
              children: [
                Row(
                  children: const <Widget>[
                    Image(
                      image: AssetImage('helpPage/Padmasambava.png'),
                      width: 130,
                    ),
                    SizedBox(width: 10),
                    Image(
                      image: AssetImage('helpPage/moredetail.png'),
                      width: 130,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                    "After uploading or capturing an image using the detection feature, the system will correctly recognize the celestial object and display its name. The user can then click the 'detail' button to access more information about the being.",
                    style: TextStyle(fontFamily: 'Dosis', fontSize: 16),
                    textAlign: TextAlign.justify)
              ],
            ),
          ),
        ),
      ];
}
