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
            DrawerHeader(
                child: Column(
              children: const [
                Image(
                  image: AssetImage("assets/bp_icon.png"),
                  height: 100,
                )
              ],
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
          title: const Text("Overview"),
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
                    textAlign: TextAlign.justify)
              ],
            ),
          ),
        ),
        Step(
          isActive: currentStep >= 1,
          title: const Text("Image From Gallery"),
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
                    textAlign: TextAlign.justify)
              ],
            ),
          ),
        ),
        Step(
          isActive: currentStep >= 2,
          title: const Text("Live Detection"),
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
                    "To access your camera, simply press the button and point it towards the direction of the Buddhist paintings. The camera will then detect the image and display the name of the painting.",
                    textAlign: TextAlign.justify)
              ],
            ),
          ),
        ),
        Step(
          isActive: currentStep >= 3,
          title: const Text("Display Prediction"),
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
                    textAlign: TextAlign.justify)
              ],
            ),
          ),
        ),
      ];
}
