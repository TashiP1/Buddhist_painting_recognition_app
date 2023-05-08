import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pytorch/flutter_pytorch.dart';
import 'package:flutter_pytorch/pigeon.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'RunModelByCameraDemo.dart';

class detectionpage extends StatefulWidget {
  const detectionpage({super.key});

  @override
  State<detectionpage> createState() => _detectionpageState();
}

class _detectionpageState extends State<detectionpage> {
  late ModelObjectDetection _objectModel;
  List? _prediction;
  String? _imagePrediction;
  File? _image;
  ImagePicker _picker = ImagePicker();
  bool objectDetection = false;
  List<ResultObjectDetection?> objDetect = [];
  @override
  void initState() {
    super.initState();
    loadModel();
  }

  //load your model
  Future loadModel() async {
    // String pathImageModel = "assets/models/model_classification.pt";
    //String pathCustomModel = "assets/models/custom_model.ptl";
    String pathObjectDetectionModel = "assets/models/buddhist.torchscript";
    try {
      // _imageModel = await FlutterPytorch.loadClassificationModel(
      //     pathImageModel, 224, 224,
      //     labelPath: "assets/labels/label_classification_imageNet.txt");
      //_customModel = await PytorchLite.loadCustomModel(pathCustomModel);
      _objectModel = await FlutterPytorch.loadObjectDetectionModel(
          pathObjectDetectionModel, 20, 640, 640,
          labelPath: "assets/labels/buddhist.txt");
    } catch (e) {
      if (e is PlatformException) {
        print("only supported for android, Error is $e");
      } else {
        print("Error is $e");
      }
    }
  }

  Future runObjectDetection() async {
    //pick a random image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    objDetect = await _objectModel.getImagePrediction(
        await File(image!.path).readAsBytes(),
        minimumScore: 0.1,
        IOUThershold: 0.3);
    objDetect.forEach((element) {
      print({
        "score": element?.score,
        "className": element?.className,
        "class": element?.classIndex,
        "rect": {
          "left": element?.rect.left,
          "top": element?.rect.top,
          "width": element?.rect.width,
          "height": element?.rect.height,
          "right": element?.rect.right,
          "bottom": element?.rect.bottom,
        },
      });
    });
    setState(() {
      //this.objDetect = objDetect;
      _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
            Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 40, right: 40, top: 100, bottom: 60),
                    child: objDetect.isNotEmpty
                        ? _image == null
                            ? const Text(
                                'No image selected.',
                                style: TextStyle(fontSize: 18),
                              )
                            : _objectModel.renderBoxesOnImage(
                                _image!, objDetect)
                        : _image == null
                            ? const Text(
                                'No image selected.',
                                style: TextStyle(fontSize: 18),
                              )
                            : Image.file(_image!),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(30),
                  child: Center(
                    child: Visibility(
                      visible: _imagePrediction != null,
                      child: Text("$_imagePrediction"),
                    ),
                  ),
                ),
                Container(
                  // color: Colors.red,
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RunModelByCameraDemo()),
                          )
                        },
                        style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(225, 232, 104, 32),
                            fixedSize: const Size(80, 60)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            Icon(
                              Icons.camera,
                              color: Colors.white,
                              size: 30,
                            ), // Set custom icon
                            Text(
                              'Camera',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ), // Set button text
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      TextButton(
                        onPressed: runObjectDetection,
                        style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(225, 232, 104, 32),
                            fixedSize: const Size(80, 60)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            Icon(
                              Icons.image,
                              color: Colors.white,
                              size: 30,
                            ), // Set custom icon
                            Text(
                              'Gallary',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ), // Set button text
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
