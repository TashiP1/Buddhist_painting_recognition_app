import 'package:buddhist_painting_recognition_app/Detection/detection.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  List imageList = [
    {"id": 1, "image_path": 'assets/slider.jpg'},
    {"id": 2, "image_path": 'assets/slider1.jpg'},
    {"id": 3, "image_path": 'assets/slider0.png'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(225, 232, 104, 32),
      ),
      body: Column(children: [
        Stack(
          children: [
            InkWell(
              child: CarouselSlider(
                items: imageList
                    .map(
                      (item) => Image.asset(
                        item['image_path'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    )
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlayInterval: const Duration(seconds: 8),
                  autoPlayAnimationDuration: const Duration(milliseconds: 2000),
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: currentIndex == entry.key ? 17 : 7,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == entry.key
                              ? Colors.white
                              : Colors.white),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        const Text(
          "Welcome",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
            margin: const EdgeInsets.all(17),
            child: Column(
              children: const [
                Text("A quote by the Dalai Lama"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "“All the elements of a Tibetan religious painting have a symbolic value. These symbols serve as aids to developing inner qualities on the spiritual path. The deities themselves are regarded as representing particular characteristics of enlightenment.“",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    height: 1.3,
                  ),
                ),
              ],
            )),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
          icon: const Icon(Icons.start_sharp),
          label: const Text("Get Started"),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, _, __) => const detectionpage(),
                transitionDuration: const Duration(milliseconds: 1000),
                transitionsBuilder: (_, animation, __, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.0, 1.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(15.00),
            fixedSize: const Size(200, 50),
            backgroundColor: const Color.fromARGB(255, 236, 178, 77),
            textStyle:
                const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
          ),
        ),
      ]),
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
              leading: const Icon(Icons.person),
              title: const Text(' About us '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(' Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.rate_review),
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
}
