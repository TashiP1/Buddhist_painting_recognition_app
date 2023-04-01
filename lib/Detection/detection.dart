import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class detectionpage extends StatefulWidget {
  const detectionpage({super.key});

  @override
  State<detectionpage> createState() => _detectionpageState();
}

class _detectionpageState extends State<detectionpage> {
  bool loading = true;
  File? file;
  var output;
  var label;
  var fine;
  ImagePicker image = ImagePicker();
  var gfg = {
    'with_mask': 'no_fine',
    'without_mask': 'Fine_100_dollar',
  };

  @override
  void initState() {
    super.initState();
    loadmodel().then((value) {
      setState(() {});
    });
  }

  detectimage(File l) async {
    var prediction = await Tflite.runModelOnImage(
      path: l.path,
      numResults: 2,
      threshold: 0.6,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      output = prediction;
      label = (output![0]['label']).toString().substring(2);
      fine = gfg[label];
      loading = false;
    });
  }

  loadmodel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  getImageFromCamera() async {
    var img = await image.pickImage(source: ImageSource.camera);

    setState(() {
      file = File(img!.path);
    });
    detectimage(file!);
  }

  getImageFromGallery() async {
    var img = await image.pickImage(source: ImageSource.gallery);

    setState(() {
      file = File(img!.path);
    });
    detectimage(file!);
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(225, 232, 104, 32),
      ),
      body: Stack(
        children: [
          Positioned(
            right: 10,
            top: 10,
            child: SvgPicture.asset(
              'assets/Border_TR.svg',
              color: const Color.fromARGB(225, 232, 104, 32),
            ),
          ),
          Positioned(
            left: 10,
            top: 10,
            child: SvgPicture.asset(
              'assets/Border_TL.svg',
              color: const Color.fromARGB(225, 232, 104, 32),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: SvgPicture.asset(
              'assets/Border_BR.svg',
              color: const Color.fromARGB(225, 232, 104, 32),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: SvgPicture.asset(
              'assets/Border_BL.svg',
              color: const Color.fromARGB(225, 232, 104, 32),
            ),
          ),
          Container(
            height: h,
            width: w,
            child: Column(
              children: [
                loading == true
                    ? Container()
                    : Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 220,
                            padding: const EdgeInsets.all(15),
                            child: Image.file(file!),
                          ),
                          Text(
                            (output![0]['label']).toString().substring(2),
                          ),
                          Text(
                            'Confidence: ' +
                                (output![0]['confidence']).toString(),
                          ),
                          Text(fine),
                        ],
                      ),
                const SizedBox(
                  height: 100,
                ),
                Stack(
                  children: [
                    Align(
                      alignment: const Alignment(-0.5, 0.8),
                      child: FloatingActionButton(
                        elevation: 0.0,
                        child: new Icon(
                          Icons.image,
                        ),
                        backgroundColor:
                            const Color.fromARGB(225, 232, 104, 32),
                        onPressed: getImageFromGallery,
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0.5, 0.8),
                      child: FloatingActionButton(
                        elevation: 0.0,
                        child: new Icon(
                          Icons.camera,
                        ),
                        backgroundColor:
                            const Color.fromARGB(225, 232, 104, 32),
                        onPressed: getImageFromCamera,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
