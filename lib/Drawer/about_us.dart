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
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          backgroundColor: const Color.fromARGB(225, 232, 104, 32)),
      body: ListView(
        padding: const EdgeInsets.all(6),
        children: [Karma(), Tashi(), Prem(), NarMaya()],
      ),
    );
  }

  Widget Karma() => Card(
        margin: const EdgeInsets.all(10),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Image(
              image: AssetImage('about/Karma.jpg'),
              width: 100,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: const [
                  Text("Karma Wangchuk"),
                  SizedBox(
                    height: 8,
                  ),
                  Text("College of Science and Technology"),
                  SizedBox(
                    height: 8,
                  ),
                  Text("Karma@gmail.com"),
                  SizedBox(
                    height: 8,
                  ),
                  Text("77445532"),
                ],
              ),
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
                  Text("Tashi Phuntsho"),
                  SizedBox(
                    height: 8,
                  ),
                  Text("College of Science and Technology"),
                  SizedBox(
                    height: 8,
                  ),
                  Text("02190161.cst@rub.edu.bt"),
                  SizedBox(
                    height: 8,
                  ),
                  Text("77334451"),
                ],
              ),
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
                  Text("Prem Bdr Bhandari"),
                  SizedBox(
                    height: 8,
                  ),
                  Text("College of Science and Technology"),
                  SizedBox(
                    height: 8,
                  ),
                  Text("02190151.cst@rub.edu.bt"),
                  SizedBox(
                    height: 8,
                  ),
                  Text("77334466"),
                ],
              ),
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
                  Text("Nar Maya Tamang"),
                  SizedBox(
                    height: 8,
                  ),
                  Text("College of Science and Technology"),
                  SizedBox(
                    height: 8,
                  ),
                  Text("02190143.cst@rub.edu.bt"),
                  SizedBox(
                    height: 8,
                  ),
                  Text("77334465"),
                ],
              ),
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
