import 'package:buddhist_painting_recognition_app/Detection/detection.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../Drawer/about_us.dart';
import '/pickers/block_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  Color currentColor = const Color.fromARGB(225, 232, 104, 32);
  List<Color> currentColors = [
    const Color.fromARGB(225, 232, 104, 32),
    Colors.green
  ];
  List<Color> colorHistory = [];

  void changeColor(Color color) => setState(() => currentColor = color);
  void changeColors(List<Color> colors) =>
      setState(() => currentColors = colors);

  List imageList = [
    {"id": 1, "image_path": 'assets/slider.jpg'},
    {"id": 2, "image_path": 'assets/slider1.jpg'},
    {"id": 3, "image_path": 'assets/slider0.png'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final foregroundColor =
        useWhiteForeground(currentColor) ? Colors.white : Colors.black;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: currentColor,
        foregroundColor: foregroundColor,
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
                  autoPlayInterval: const Duration(seconds: 4),
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
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
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Dosis',
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
            margin: const EdgeInsets.all(17),
            child: Column(
              children: const [
                Text(
                  "A quote by the Dalai Lama",
                  style: TextStyle(fontFamily: 'Dosis', fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "“All the elements of a Tibetan religious painting have a symbolic value. These symbols serve as aids to developing inner qualities on the spiritual path. The deities themselves are regarded as representing particular characteristics of enlightenment.“",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      height: 1.4,
                      fontFamily: 'Dosis',
                      fontSize: 16),
                ),
              ],
            )),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: 200.0,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                offset: Offset(0.0, 20.0),
                blurRadius: 30.0,
                color: Colors.black12,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(22.0),
          ),
          child: Row(
            children: [
              InkWell(
                onTap: () => {
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
                  )
                },
                child: Container(
                  height: 60.0,
                  width: 130.0,
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 12.0),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 236, 178, 77),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(95.0),
                          topLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(200.0))),
                  child: Text(
                    "Get Started",
                    style: Theme.of(context).textTheme.labelLarge?.apply(
                        color: const Color.fromARGB(255, 239, 240, 243)),
                  ),
                ),
              ),
              const Image(
                image: AssetImage('assets/start.png'),
                width: 40,
              ),
            ],
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
            )),
            builder: (context) => Center(
              child: BlockColorPickerExample(
                pickerColor: currentColor,
                onColorChanged: changeColor,
                pickerColors: currentColors,
                onColorsChanged: changeColors,
                colorHistory: colorHistory,
              ),
            ),
          );
        },
        backgroundColor: currentColor,
        foregroundColor: foregroundColor,
        child: const Icon(Icons.settings),
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
                  builder: (context) => about(),
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
}
