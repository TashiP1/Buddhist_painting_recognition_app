import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ObjectDetails extends StatefulWidget {
  final String parameter;

  const ObjectDetails({required this.parameter});

  @override
  State<ObjectDetails> createState() => _ObjectDetailsState();
}

class _ObjectDetailsState extends State<ObjectDetails> {
  Future<Map<String, dynamic>?> getImageData(String parameter) async {
    try {
      // Get the Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      String classname = parameter;
      // Get the document based on the parameter value
      DocumentSnapshot snapshot =
          await firestore.collection('paintings').doc(parameter.trim()).get();

      // Extract the data from the document
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

      return data;
    } catch (e) {
      print('Error retrieving image data: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: getImageData(widget.parameter),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else if (snapshot.hasData) {
          final imageUrl = snapshot.data?['imgurls'];
          final description = snapshot.data?['Descriptions'];
          final description1 = snapshot.data?['Descriptions1'];
          final heading = snapshot.data?['heading'];

          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 223, 98, 40),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Stack(
              children: [
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: SvgPicture.asset(
                    'assets/Border_BR.svg',
                    color: const Color.fromARGB(255, 223, 98, 40),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: SvgPicture.asset(
                    'assets/Border_BL.svg',
                    color: const Color.fromARGB(255, 223, 98, 40),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 100),
                  child: ListView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            imageUrl,
                            width: 300,
                            height: 300,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              heading,
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Dosis',
                                height: 1.4,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              description,
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Dosis',
                                height: 1.4,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              description1,
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Dosis',
                                height: 1.4,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text(
                'No data found.',
                style: TextStyle(fontFamily: 'Dosis'),
              ),
            ),
          );
        }
      },
    );
  }
}
