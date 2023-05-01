import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Home.dart';

class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          backgroundColor: const Color.fromARGB(225, 232, 104, 32)),
      body: ListView(
        padding: const EdgeInsets.all(6),
        children: [desc(), Karma(), Tashi(), Prem(), NarMaya()],
      ),
    );
  }

  Widget desc() => Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: const [
          Text(
            "Developers",
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Dosis',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
              "We, a group of students at the College of Science and Technology, developed an object detection project under the guidance of Sir Karma Wangchuck. We hope that our project will inspire others to explore the possibilities of computer vision and contribute to the development of innovative solutions to promote Bhutan.",
              style: TextStyle(fontSize: 16, height: 1.3, fontFamily: 'Dosis'),
              textAlign: TextAlign.justify),
        ],
      ));

  Widget Karma() => Card(
        margin: const EdgeInsets.all(10),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Image(
                  image: AssetImage('about/Karma.jpg'),
                  width: 90,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: const [
                      Text("Karma Wangchuk",
                          style: TextStyle(fontFamily: 'Dosis')),
                      SizedBox(
                        height: 8,
                      ),
                      Text("karma.cst@rub.edu.bt",
                          style: TextStyle(fontFamily: 'Dosis')),
                      SizedBox(
                        height: 8,
                      ),
                      Text("77259089", style: TextStyle(fontFamily: 'Dosis')),
                    ],
                  ),
                ),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  child: const Image(
                    image: AssetImage('about/facebook.png'),
                    width: 30,
                  ),
                  onPressed: () {},
                ),
                OutlinedButton(
                  child: const Image(
                    image: AssetImage('about/insta.png'),
                    width: 30,
                  ),
                  onPressed: () {},
                ),
                OutlinedButton(
                  child: const Image(
                    image: AssetImage('about/twitter.png'),
                    width: 30,
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      );

  Widget Tashi() => Card(
        margin: const EdgeInsets.all(10),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Image(
                  image: AssetImage('about/Tashi.jpg'),
                  width: 100,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: const [
                      Text("Tashi Phuntsho",
                          style: TextStyle(fontFamily: 'Dosis')),
                      SizedBox(
                        height: 8,
                      ),
                      Text("02190161.cst@rub.edu.bt",
                          style: TextStyle(fontFamily: 'Dosis')),
                      SizedBox(
                        height: 8,
                      ),
                      Text("77334451", style: TextStyle(fontFamily: 'Dosis')),
                    ],
                  ),
                ),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  child: const Image(
                    image: AssetImage('about/facebook.png'),
                    width: 30,
                  ),
                  onPressed: () {},
                ),
                OutlinedButton(
                  child: const Image(
                    image: AssetImage('about/insta.png'),
                    width: 30,
                  ),
                  onPressed: () {},
                ),
                OutlinedButton(
                  child: const Image(
                    image: AssetImage('about/twitter.png'),
                    width: 30,
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      );

  Widget Prem() => Card(
        margin: const EdgeInsets.all(10),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Image(
                  image: AssetImage('about/prem.jpg'),
                  width: 100,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: const [
                      Text("Prem Bdr Bhandari",
                          style: TextStyle(fontFamily: 'Dosis')),
                      SizedBox(
                        height: 8,
                      ),
                      Text("02190151.cst@rub.edu.bt",
                          style: TextStyle(fontFamily: 'Dosis')),
                      SizedBox(
                        height: 8,
                      ),
                      Text("77334466", style: TextStyle(fontFamily: 'Dosis')),
                    ],
                  ),
                ),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  child: const Image(
                    image: AssetImage('about/facebook.png'),
                    width: 30,
                  ),
                  onPressed: () {},
                ),
                OutlinedButton(
                  child: const Image(
                    image: AssetImage('about/insta.png'),
                    width: 30,
                  ),
                  onPressed: () {},
                ),
                OutlinedButton(
                  child: const Image(
                    image: AssetImage('about/twitter.png'),
                    width: 30,
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      );

  Widget NarMaya() => Card(
        margin: const EdgeInsets.all(10),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Image(
                  image: AssetImage('about/NarMaya.jpg'),
                  width: 100,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: const [
                      Text("Nar Maya Tamang",
                          style: TextStyle(fontFamily: 'Dosis')),
                      SizedBox(
                        height: 8,
                      ),
                      Text("02190143.cst@rub.edu.bt",
                          style: TextStyle(fontFamily: 'Dosis')),
                      SizedBox(
                        height: 8,
                      ),
                      Text("77334465", style: TextStyle(fontFamily: 'Dosis')),
                    ],
                  ),
                ),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  child: const Image(
                    image: AssetImage('about/facebook.png'),
                    width: 30,
                  ),
                  onPressed: () {},
                ),
                OutlinedButton(
                  child: const Image(
                    image: AssetImage('about/insta.png'),
                    width: 30,
                  ),
                  onPressed: () {},
                ),
                OutlinedButton(
                  child: const Image(
                    image: AssetImage('about/twitter.png'),
                    width: 30,
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      );
}
